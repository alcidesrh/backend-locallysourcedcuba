(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([[45],{"467f5":function(e,t,n){"use strict";n.r(t);var a=n("7a23");const c=Object(a["l"])("div",{class:"text-subtitle1"},"Edit Service",-1);function o(e,t,n,o,i,s){const u=Object(a["K"])("FormService"),d=Object(a["K"])("q-page");return Object(a["C"])(),Object(a["h"])(d,{padding:""},{default:Object(a["T"])((()=>[c,e.item?(Object(a["C"])(),Object(a["h"])(u,{key:0,onSubmit:e.onSubmit,loading:e.loading},null,8,["onSubmit","loading"])):Object(a["i"])("",!0)])),_:1})}var i=n("54bd"),s=n("3203"),u=n("1840"),d=n("3924"),r=n("6c02"),b=n("7b9e"),l=Object(a["m"])({setup(){const{item:e,items:t,getItem:n}=Object(s["a"])(),a=Object(r["c"])();!e.value.id&&a.params.id&&n(a.params.id);const{mutate:c,onError:o,onDone:i,loading:l}=Object(u["d"])(d["updateServiceMutation"],(()=>({update:e=>{const n=e.readQuery({query:d["listServiceQuery"]});n&&(t.value=n.services)}})));o((e=>{Object(b["b"])(e)}));const m=Object(r["d"])();i((()=>{m.push({name:"ListService"})}));const p=()=>{"string"===typeof e.value.daysToShow&&(e.value.daysToShow=parseInt(e.value.daysToShow));const t=Object.assign({},e.value);delete t._id,delete t.__typename,c({input:t})};return{onSubmit:p,item:e,loading:l}},components:{FormService:i["default"]}}),m=n("9989"),p=n("eebe"),j=n.n(p);l.render=o;t["default"]=l;j()(l,"components",{QPage:m["a"]})}}]);