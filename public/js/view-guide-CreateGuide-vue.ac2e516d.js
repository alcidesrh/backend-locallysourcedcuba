(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([[21],{"7cd7":function(e,t,n){"use strict";n.r(t);var a=n("7a23");const u=Object(a["l"])("div",{class:"text-subtitle1"},"New Guide",-1);function i(e,t,n,i,c,o){const l=Object(a["K"])("FormGuide"),s=Object(a["K"])("q-page");return Object(a["C"])(),Object(a["h"])(s,{padding:""},{default:Object(a["T"])((()=>[u,Object(a["l"])(l,{onSubmit:e.onSubmit,onCancel:e.cancel,loading:e.loading},null,8,["onSubmit","onCancel","loading"])])),_:1})}var c=n("acf6"),o=n("c0ce"),l=n("1840"),s=n("5daf"),d=n("6c02"),r=n("7b9e"),b=Object(a["m"])({setup(){const{item:e,variablesListQuery:t}=Object(o["a"])();e.value={};const{mutate:n,loading:a,onError:u,onDone:i}=Object(l["d"])(s["createGuideMutation"],(()=>({update:(n,{data:{createGuide:{guide:a}}})=>{const u=Object.assign(Object.assign({},a),e.value),i=n.readQuery({query:s["listGuideQuery"],variables:t.value});n.writeQuery({query:s["listGuideQuery"],data:{listGuides:{collection:[...(null===i||void 0===i?void 0:i.listGuides.collection)||[],u]}},variables:t.value})}}))),c=Object(d["d"])();i((()=>{c.push({name:"ListGuide"})})),u((e=>{Object(r["b"])(e)}));const b=()=>{"string"===typeof e.value.bonus&&(e.value.bonus=parseInt(e.value.bonus)),n({input:e.value})};return{loading:a,cancel(){e.value={},c.push({name:"ListGuide"})},onSubmit:b}},components:{FormGuide:c["default"]}}),v=n("9989"),p=n("eebe"),j=n.n(p);b.render=i;t["default"]=b;j()(b,"components",{QPage:v["a"]})}}]);