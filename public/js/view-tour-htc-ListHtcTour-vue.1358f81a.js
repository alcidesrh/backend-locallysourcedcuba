(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([[49],{2235:function(t,e,c){"use strict";c.r(e);var o=c("7a23");const a={class:"tw-absolute tw-top-1 tw-right-1"},l={class:"row tw-w-full tw-mt-5"},i={class:"col-12 tw-flex tw-items-center"},s={key:0,class:"tw-flex tw-justify-end tw-items-center"},n={class:"row"},r={class:"col tw-flex tw-items-center",style:{"max-width":"150px"}},d={class:"col tw-flex tw-items-center"},b={key:0,style:{left:"-8px",top:"-9px",background:"whitesmoke"},class:"tw-text-xs tw-transform tw--rotate-12 tw-font-bold tw-uppercase tw-text-red-700 tw-border tw-border-red-700 tw-absolute"},u={class:"tw-p-0 tw-font-semibold tw-text-white tw-flex tw-items-center"},O={class:"tw-ml-3"},j={class:"tw-ml-5 tw-bg-white tw-tracking-widest",style:{"border-radius":"50px",padding:"0px 10px"}},p=Object(o["l"])("div",{class:"tw-text-bassde"},"Show Tour Info",-1),w={class:"tw-text-base tw-font-black"},m={key:0,class:"tw-text-sm"},f=Object(o["k"])(" Guide: "),v={class:"tw-font-semibold"},h={key:0,class:"tw-p-10 tw-text-center tw-text-gray-400 tw-font-semibold tw-text-md"},T=Object(o["l"])("label",null,"No result found",-1);function g(t,e,c,g,y,x){const C=Object(o["K"])("PendingNotificationTour"),k=Object(o["K"])("SearchTour"),Y=Object(o["K"])("q-card"),M=Object(o["K"])("BaseButton"),D=Object(o["K"])("q-icon"),q=Object(o["K"])("q-tooltip"),Q=Object(o["K"])("q-chip"),S=Object(o["K"])("q-item-section"),E=Object(o["K"])("q-item"),H=Object(o["K"])("q-separator"),K=Object(o["K"])("q-list"),N=Object(o["K"])("q-page"),_=Object(o["K"])("ShowHtcTour");return Object(o["C"])(),Object(o["h"])(o["a"],null,[Object(o["l"])(N,{padding:""},{default:Object(o["T"])((()=>[Object(o["l"])(Y,{flat:"",class:"tw-mt-0 tw-flex tw-items-center tw-p-5"},{default:Object(o["T"])((()=>[Object(o["l"])("div",a,[Object(o["l"])(C,{"edit-route":"EditHtcTour"})]),Object(o["l"])("div",l,[Object(o["l"])("div",i,["htc"==t.service.code?(Object(o["C"])(),Object(o["h"])(k,{key:0})):Object(o["i"])("",!0)])])])),_:1}),t.service.daysToShow?(Object(o["C"])(),Object(o["h"])("div",s,[Object(o["l"])("div",{class:"tw-font-semibold tw-text-gray-700",innerHTML:t.showing},null,8,["innerHTML"]),Object(o["l"])(M,{label:"Create Tour",icon:"add",type:"button",color:"primary",class:"q-ml-sm tw-ml-5",onClick:e[1]||(e[1]=e=>t.$router.push({name:"CreateHtcTour"}))})])):Object(o["i"])("",!0),Object(o["l"])(K,{class:"tw-mt-5"},{default:Object(o["T"])((()=>[(Object(o["C"])(!0),Object(o["h"])(o["a"],null,Object(o["I"])(Object.keys(t.tours),((e,c)=>(Object(o["C"])(),Object(o["h"])("div",{key:c},[Object(o["l"])(E,null,{default:Object(o["T"])((()=>[Object(o["l"])(S,null,{default:Object(o["T"])((()=>[Object(o["l"])("div",n,[Object(o["l"])("div",r,[Object(o["l"])("div",{class:"tw-text-gray-500 tw-font-semibold tw-text-center",innerHTML:t.dateColumn(e)},null,8,["innerHTML"])]),Object(o["l"])("div",d,[Object(o["l"])("div",null,[(Object(o["C"])(!0),Object(o["h"])(o["a"],null,Object(o["I"])(t.tours[e],(e=>(Object(o["C"])(),Object(o["h"])("span",{key:e.id},[Object(o["l"])(Q,{class:"tw-mr-2 tw-py-3 tw-my-2",style:{backgroundColor:e.color}},{default:Object(o["T"])((()=>[e.canceled?(Object(o["C"])(),Object(o["h"])("div",b,"Canceled")):Object(o["i"])("",!0),Object(o["l"])("div",u,[Object(o["l"])("label",{onClick:Object(o["V"])((c=>{t.refreshView=!t.refreshView,t.id=e.id}),["stop"]),class:"tw-bg-gray-700 tw-tracking-widest tw-cursor-pointer",style:{"border-radius":"50px",padding:"0px 10px"}},Object(o["O"])(e.code),9,["onClick"]),Object(o["l"])("span",O,[(Object(o["C"])(!0),Object(o["h"])(o["a"],null,Object(o["I"])(e.notifications,((e,c)=>(Object(o["C"])(),Object(o["h"])(D,{onClick:Object(o["V"])((c=>t.updateNotification(e)),["stop"]),style:{"border-radius":"50px","font-size":"15px"},class:["tw-mx-1 tw-bg-gray-100 tw-p-1 tw-cursor-pointer",{"tw-text-gray-500":!e.complete,"text-teal":e.complete}],key:c,name:e.icon},null,8,["onClick","class","name"])))),128))]),Object(o["l"])("span",j,[Object(o["l"])(D,{onClick:Object(o["V"])((c=>{t.refreshView=!t.refreshView,t.id=e.id}),["stop"]),class:"q-mr-sm",name:"visibility",color:"blue",style:{"font-size":"20px",cursor:"pointer"}},{default:Object(o["T"])((()=>[Object(o["l"])(q,{class:"bg-indigo",anchor:"top middle",self:"bottom middle",offset:[10,10]},{default:Object(o["T"])((()=>[p])),_:1})])),_:2},1032,["onClick"]),Object(o["l"])(D,{onClick:Object(o["V"])((c=>t.edit(e._id)),["stop"]),class:"q-mr-sm",name:"edit",color:"teal",style:{"font-size":"20px",cursor:"pointer"}},null,8,["onClick"]),Object(o["l"])(D,{onClick:Object(o["V"])((c=>t.updateTour(e)),["stop"]),class:"q-mr-sm",name:null!==e&&void 0!==e&&e.canceled?"check_circle":"cancel",color:"orange",style:{"font-size":"20px",cursor:"pointer"}},{default:Object(o["T"])((()=>[Object(o["l"])(q,{class:"bg-orange",anchor:"top middle",self:"bottom middle",offset:[10,10]},{default:Object(o["T"])((()=>[Object(o["l"])("div",{class:"tw-text-sm",textContent:Object(o["O"])(e.canceled?"Activate Tour":"Cancel Tour")},null,8,["textContent"])])),_:2},1024)])),_:2},1032,["onClick","name"]),Object(o["l"])(D,{onClick:Object(o["V"])((c=>t.remove(e)),["stop"]),name:"delete",color:"negative",style:{"font-size":"20px",cursor:"pointer"}},null,8,["onClick"])])])])),_:2},1032,["style"]),Object(o["l"])(q,null,{default:Object(o["T"])((()=>[Object(o["l"])("div",w,Object(o["O"])(e.name),1),e.guide?(Object(o["C"])(),Object(o["h"])("div",m,[f,Object(o["l"])("span",v,Object(o["O"])(e.guide.name),1)])):Object(o["i"])("",!0)])),_:2},1024)])))),128))])])])])),_:2},1024)])),_:2},1024),Object(o["l"])(H,{spaced:"",inset:""})])))),128)),Object.keys(t.tours).length||t.loadingList?Object(o["i"])("",!0):(Object(o["C"])(),Object(o["h"])("div",h,[T]))])),_:1})])),_:1}),t.id?(Object(o["C"])(),Object(o["h"])(_,{id:t.id,key:t.refreshView,onEdit:t.edit,onRemove:t.remove,onUpdateNotification:t.updateNotification,onUpdateTour:t.updateTour},null,8,["id","onEdit","onRemove","onUpdateNotification","onUpdateTour"])):Object(o["i"])("",!0)],64)}var y=c("200d"),x=c("6c02"),C=c("1840"),k=c("f32a"),Y=c("7b9e"),M=c("b3fe"),D=c("5a0c"),q=c.n(D),Q=c("f906"),S=c.n(Q),E=c("56ff"),H=c("3203"),K=c("8bd8"),N=c("01af"),_=c("9530"),V=c.n(_),I=c("3f1c"),$=c("3a18"),L=c("6a2b"),z=c("5c8a"),U=c("ddd6"),P=Object(o["m"])({components:{SearchTour:E["default"],ShowHtcTour:N["default"],PendingNotificationTour:L["default"]},setup(){q.a.extend(S.a);const t=Object(x["d"])(),e=Object(M["a"])(),{list:c,items:a,search:l,templates:i,getTemplates:s}=Object(y["a"])(),{getTours:n,loading:r}=c(),{getNotificationsTour:d}=Object(K["a"])(),{refetch:b,load:u,onResult:O}=d();if(O((()=>{a.value.length||n()})),a.value.length){const t=$["cache"].readQuery({query:k["listTourQuery"],variables:l.value});t&&(a.value=Object(z["a"])(t.listTours))}const{getNotifications:j}=Object(U["b"])();j("htc");const{setServiceInUse:p,service:w}=Object(H["a"])();Object(o["S"])((()=>w.value.code),(()=>{u()}));const{getService:m}=p();m("htc"),Object(o["E"])("service",w),Object(o["E"])("search",l),i.value.length||s(),Object(o["E"])("templates",i);const f=Object(o["H"])(""),{mutate:v,onError:h,onDone:T,loading:g}=Object(C["d"])(k["deleteTourMutation"],(()=>({update:(t,{data:{deleteTour:{tour:{id:e}}}})=>{a.value=a.value.filter((t=>t.id!=e)),t.writeQuery({query:k["listTourQuery"],variables:Object.assign({},l.value),data:{listTours:a.value}})}})));h((t=>{Object(Y["b"])(t)})),T((()=>{Object(Y["c"])({message:"The item have been deleted."})})),Object(o["S"])([r,g],(([t,e])=>I["a"].value=t||e)),Object(o["E"])("getTours",n),Object(o["E"])("loading",r);const{mutate:D,onError:Q,onDone:E}=Object(C["d"])(V.a`
        mutation updateNotificationTourMutation(
          $input: updateNotificationTourInput!
        ) {
          updateNotificationTour(input: $input) {
            notificationTour {
              id
              complete
            }
          }
        }
      `);E((()=>{b()})),Q((t=>{Object(Y["b"])(t)}));const{mutate:N,onError:_}=Object(C["d"])(V.a`
          mutation updateHtcTourMutation($input: updateTourInput!) {
            updateTour(input: $input) {
              tour {
                id
                canceled
                color
              }
            }
          }
        `);_((t=>{Object(Y["b"])(t)}));const L=Object(o["f"])((()=>{let t=[];return a.value.forEach((e=>{const c=q()(e.startDate).format("MM/DD/YYYY");t[c]||(t[c]=[]),t[c].push(e)})),t}));return{id:Object(o["H"])(null),refreshView:Object(o["H"])(!1),service:w,tours:L,loadingList:r,edit(e){t.push({name:"EditHtcTour",params:{id:e}})},remove(t){g.value||e.dialog({title:"Confirm",message:"Would you like to delete this item?",cancel:!0,persistent:!0}).onOk((()=>{f.value=t.startDate,v({input:{id:t.id}})}))},dateColumn(t){return`<div>${q()(t).format("dddd")}</div><div>${q()(t).format("DD/MM/YYYY")}</div>`},showing:Object(o["f"])((()=>{let t="",e="";return t=l.value.from?q()(l.value.from).format("DD/MM/YYYY"):q()().format("DD/MM/YYYY"),e=l.value.to?q()(l.value.to).format("DD/MM/YYYY"):q()(l.value.from||new Date).add(w.value.daysToShow||0,"day").format("DD/MM/YYYY"),`<span class="tw-text-gray-700">Showing </span> ${q()(e,"DD/MM/YYYY").diff(q()(t,"DD/MM/YYYY"),"day")}<span class="tw-text-gray-700"> days. From</span> `+t+' <span class="tw-text-gray-700">to</span> '+e})),updateNotification(t){D({input:{id:t.id,complete:!t.complete}}),t.complete=!t.complete,$["cache"].writeQuery({query:k["listTourQuery"],variables:Object.assign({},l.value),data:{listTours:a.value}})},updateTour(t){N({input:{id:t.id,canceled:!t.canceled}})}}}}),R=c("9989"),B=c("f09f"),J=c("1c1c"),A=c("66e5"),F=c("4074"),G=c("b047"),W=c("0016"),X=c("05c0"),Z=c("eb85"),tt=c("eebe"),et=c.n(tt);P.render=g;e["default"]=P;et()(P,"components",{QPage:R["a"],QCard:B["a"],QList:J["a"],QItem:A["a"],QItemSection:F["a"],QChip:G["a"],QIcon:W["a"],QTooltip:X["a"],QSeparator:Z["a"]})}}]);