(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([[33],{"0d27":function(t,e,n){"use strict";n.r(e);var o=n("7a23");const a=Object(o["l"])("div",{class:"text-subtitle1"},"Edit Location",-1);function c(t,e,n,c,i,s){const u=Object(o["K"])("FormLocation"),b=Object(o["K"])("q-page");return Object(o["C"])(),Object(o["h"])(b,{padding:""},{default:Object(o["T"])((()=>[a,t.item?(Object(o["C"])(),Object(o["h"])(u,{key:0,onSubmit:t.onSubmit,loading:t.loading},null,8,["onSubmit","loading"])):Object(o["i"])("",!0)])),_:1})}var i=n("2f17"),s=n("2d7d"),u=n("1840"),b=n("ff99"),d=n("6c02"),r=n("7b9e"),l=Object(o["m"])({setup(){const{item:t,items:e,getItem:n,variablesListQuery:o}=Object(s["a"])(),a=Object(d["c"])();!t.value.id&&a.params.id&&n(a.params.id);const{mutate:c,onError:i,onDone:l,loading:m}=Object(u["d"])(b["updateLocationMutation"],(()=>({update:t=>{const n=t.readQuery({query:b["listLocationQuery"],variables:o.value});n&&(e.value=n.listLocations.collection)}})));i((t=>{Object(r["b"])(t)}));const j=Object(d["d"])();l((()=>{j.push({name:"ListLocation"})}));const p=()=>{const e=Object.assign({},t.value);c({input:e})};return{onSubmit:p,item:t,loading:m}},components:{FormLocation:i["default"]}}),m=n("9989"),j=n("eebe"),p=n.n(j);l.render=c;e["default"]=l;p()(l,"components",{QPage:m["a"]})}}]);