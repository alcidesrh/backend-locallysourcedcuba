<?php

namespace App\GraphqlResolver;

use ApiPlatform\Core\GraphQl\Resolver\MutationResolverInterface;
use App\Entity\Tour;
use Doctrine\ORM\EntityManagerInterface;

final class TourUpdateResolver implements MutationResolverInterface
{

    public function __construct(private EntityManagerInterface $em)
    {

    }
    public function __invoke($item, array $context)
    {
        $code = $this->generateCode($item);

        if ($items = $this->em->getRepository(Tour::class)->findByCode($code, $item->getId())) {
            $last = $items[count($items) - 1];
            if ($pos = strrpos($last->getCode(), '-')) {
                $count = substr($last->getCode(), $pos + 1);
            }

            $code .= $pos && is_numeric($count) ? '-' . ((int) $count + 1) : '-' . intval(count($items) + 1);
            $item->setCode($code);
        } else {
            $item->setCode($code);
        }

        return $item;
    }

    public function generateCode(Tour $tour, $ext = false)
    {
        $serviceCode = strtoupper($tour->getService()->getCode());
        $date = str_replace('-', '', $tour->getStartDate()->format("d-m-y"));
        // $private = ($type == 'private' && $template && $template->getType() == 'group') ? '-P' : '';
        $agent = ($tour->getAgent()) ? '-A' : '';
        $templateCode = $tour->getTemplate()->getCode();
        // ($template) ? $template->getCode() : $em->getRepository('App:CodeTourOneDay')->findOneBy(
        //     []
        // )->getName();

        return $serviceCode . $date . $templateCode . $agent;
    }
}
