Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,LOTS_OF_MONEY,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E917C433DF
	for <linux-firmware@archiver.kernel.org>; Mon, 17 Aug 2020 12:17:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 406DC20786; Mon, 17 Aug 2020 12:17:33 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1BA222076E
	for <linux-firmware@kernel.org>; Mon, 17 Aug 2020 12:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597666653;
	bh=R+of5NhKQNFv0yj0knkcs189ZwW9j/CHjvKtLo0aeTM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=tbsAG3I1utwQPzQi5ppghiyBT75740j19XJC37lD1Go9rElrkObw0W5GpTUrcBjen
	 G1bUKOk5VtOzRJqjD53iW34I+J9892u1dSrCWDrPQSUBanQwzeASMg+zV7Fo/NAgNG
	 N4sQDA9mG61UcBUPAX37gNtAjow0o9JZCY00LlRQ=
Received: by mail-io1-f52.google.com with SMTP id q75so17443701iod.1
        for <linux-firmware@kernel.org>; Mon, 17 Aug 2020 05:17:33 -0700 (PDT)
X-Gm-Message-State: AOAM531akZMO+VLr6c1LXrrWMClqtkKl2nAolb0wcGygcUo4W5FgVrbD
	d8pvvMg1eAmWqrvn8w91j5rAjfYR3wgxqJHCY08=
X-Google-Smtp-Source: ABdhPJx4AX5IdeR7Y4nXhJ2jkHFW1zCGWfjFTI4JG5Th0SFAnmFq7tP3Cqv9eWxFy2z+3aixwJ+EUtcLsTMP/1cEOjk=
X-Received: by 2002:a02:2a81:: with SMTP id w123mr14075666jaw.107.1597666652329;
 Mon, 17 Aug 2020 05:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200807073723.9334-1-hildawu@realtek.com>
In-Reply-To: <20200807073723.9334-1-hildawu@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 17 Aug 2020 08:17:21 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7SUSA8q93p0p8DY_AK_Pd3zBv6bLydMUzsPa3E1dPZ2A@mail.gmail.com>
Message-ID: <CA+5PVA7SUSA8q93p0p8DY_AK_Pd3zBv6bLydMUzsPa3E1dPZ2A@mail.gmail.com>
Subject: Re: [PATCH] rtl_bt: Update RTL8822C BT UART firmware to 0x0599_8A4F
To: hildawu@realtek.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Max Chou <max.chou@realtek.com>, =?UTF-8?B?6ZmG5pyx5Lyf?= <alex_lu@realsil.com.cn>, 
	kidman@realtek.com
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Fri, Aug 7, 2020 at 3:37 AM <hildawu@realtek.com> wrote:
>
> From: Hilda Wu <hildawu@realtek.com>
>
> This firmware patch update for Realtek RTL8822C BT UART controller.
>
> Release Version: 0x0599_8A4F
>
> Signed-off-by: Hilda Wu <hildawu@realtek.com>
> ---
>  rtl_bt/rtl8822cs_fw.bin | Bin 56288 -> 58640 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/rtl_bt/rtl8822cs_fw.bin b/rtl_bt/rtl8822cs_fw.bin
> index 2bafae366a2150c63125562a1dc941404a6902da..bd92ad58c9feeb03378e1bbb49cb1f75e0c9e3b7 100644
> GIT binary patch
> delta 8335
> zcmZuW30M?I*4;Bb2X{|{fT%D5yil?Tm}tz=f<{m<YA)lkI|Gu2nI4R&8#TI9s8NGx
> z!1g4^j>Bja(ZDnw*~A3!hzBGb@nU0s)Tr1q=%A?4jm!V42jcGc|KEId^s85|URAw%
> z*R&s2mYh*W%*ZkFi*mAaUn|<7QW7MgASmMZ7d8(~E3A&l&$bph*|H*WeN{^G%4Br5
> zNMz3fL?UvO=8v3)dSCN8sMm?mZ~MqO@#06`o>&CmMNqG=HngpGt`}=PGcT<N*m`+x
> zku&X5ku&`g(8aLcx)}P!qPN}v{S6}2acvu%lP+!$Hv(W|Z~Za!KNh`p3G_=uxfY&e
> zkGB@e3m~x&;Dx>QO6ac?z4a>S6DECET5Vx3<SBfWh(}k6tD#=qTYm`s4@Gai2KsA6
> zxpuyBX^prRzSnwddDXQ})(R)HM*iqSTq|;b#P=bJa9(ZeytVTq5ue(OOCLE?piH_%
> zn3R?y(pr(=$^5gonNBjZa`eG#=tMZbT_Ptl?$T?7+4ytq&&JF1e$M&1hcA|>SvQQ!
> zf#Py`&E-xjzM5B@tY?*dnTU?Do-F%PxS*vX)NM<}Wl&RQF9i3O$q>ypb*ZX^xI<+V
> zITN1Ip)7(yFKQWNfVQ)VM#K>Y&4X{%UK%9?Gsp<7>I)imGYlFFtv|p9?WR#iC}TxO
> z)C_u5MWe9_9s1p$K}-E~DDMc3cHsgOw*#TlJv2fvsXxG0L;K-D8ZCi#@V7LY1MS$O
> zG@AJ)gFZVzqZ8lL=tZED1B_HcJH3HMR3L+PoTAalAO;0EU>w?aPSWUNfR#b-0oRQh
> z9eQUMjpnHsG#=WSfUqAB6GDI}wB4}ClXEnx31!gr8X6hkd;C|x9N=F8rq;nGnvc;a
> z7v_zH)<Xllo<?qH$5T2)0G+u?9cqVp{Zu-%2)=XFIyBM>ol@9&9+ZK;3_5ri7KI&G
> z|4t)aGmZA%qtON+_`41m^?}8|q0x$c0IP*#gx$Rf_|srs&X>SE5YK>e;t-7%KpE|%
> z(dlX$Y2iASL#g`_=KhO76!e!s8U8hmB7OrRyPz`=+A*-3#&8{a5x8FL6wbf9u^$h3
> z??EBVN)QWu2Vo*|%tF^oQ!={WVGw_qL1q}maDQh&jlp3nqfETyAI(0rkA63a<PW%t
> zT_ATZ!bHXBJ4lnt$=U%shsc>`BdRbbxBM6+{KVy2|CQ~NrES(UP2fUnLJ#%i8b0lL
> z7?tPW+2CUH8(oH<M@ozsG}!P-dsie+wXm*OOOQxyLi^an;*J1mq{N<8(cV$kW#@dH
> zKHIdVhB8eFTSnYbfuttDf&@XJVv0dO(8Qr(@a=HqIMN*cHG0pP5e|}Xa0kX3lJ>g{
> zNrt3s_!V|j3suG+%=r>IOW!e*^X@-+jPOG4%cNFVn!C`d6@8q@Zrj)16=g!ntCK6G
> z4HEDTPmMi`(OFmtzXyd=-+|hQ9DEUvvIDaGoBf*14%$R<yo5YK(YX!{931la#;xEY
> zP3dPRISCJ=W+h6cH0eEaY9}}|FHUeyy-1iRrK%>UC8oDOQ})L8SFF5k=QMkUn>9_5
> z@X~DE=Ix}V#8H-9>E8a_cz(S*!`<jcb<aEXp2_yYR7zbbsehU`nu$&Vwhec6rh_+T
> zy49O5bBueYJN*FTp5-Rvu6Hm}N@ECJ!f9H4&c%VQ(4JRs)^7FLvRyiO<1+Wr0Y)m5
> z$dT7OtQb)ve8#0!9_8jGmtHTbtlydH4m7O4>OBR$Wqe%}pOUz*vsh~A%<Qz+Y3V3_
> zd|gUnu~e7Q;LdcftiuF*O!1Sax@|kjIomm_=~MX}**bDck14~Yn7zgru+6{JuLQ*J
> zjt1_sG+BjgWi)bFp-LVD@(IU!X@m;(36Y_)&VlX`aHPatqM#@5%yYm_uHG2JZ@<kr
> zkB@%yx?#W0sXFKHqFNa@D~)sq@fmLAB1%wg2{5K|{t^pJuXh)NV5y>SK8(UrEwPPQ
> zs5CMgs_YPkIAkT~JY5uc?bJJh28WoJ+@eJwd@JKt;ds`S;iiO?gi?-mDH8nXNb_&$
> zOKvf4G9$ySmDO-cf+B&O=_Ngr^GYkG`_6yR9^`n@v4SHK;yYj?rkt6TlHPNqTyOO(
> zFQ*Liat9tKat9r!&e=H%NUB<U`2@k&)lq*4Tu<&i&fhf(-)E~<P_<}h`x;dIc2~TU
> zaTTVr(z;~K%B!@k%Rg_7YgnrPtw_tz!`jxNRgCoHs^-FxTT~0vxprbu2HT-N7jsCx
> z#hP(@^+fnMpOT;l!w-9u6bYJbT0y-vX6ULfl$L?j8$lFHuhe#xIX1fb$Jn`WSbhx`
> zelVkxiKm2|E5zNcdkM2P_SK|MTv(*={uoz=E4v-{GCBhBhBi;*dL=-<|Flv9;S(Ab
> z`2uKi==Ag`iAvC$SQb8-sX_#}CG$!N;cbi2@3RW84%8oEgqxN;U#t&(K!@s&h*Iti
> zMdY3c9m3iSo3G(oHR}8q9R2^0=$Ri#^kJoN+k8WqldsoIgef^ANa2{}8ReA<T4?20
> zXfUbjFKJ;_{={c-e+yW(Mkv!k9lr#n@n;$>g)$t<7#J`8gg|u{Xw-Q@e30);D)v?h
> ziucY~DQ*a-_te@Hrg^&>q&2%j;*<+Xqb`;)v2|!aMFhhURB`Oi6<i?y`mrjGhHomL
> zGzHUdY^S5s%L1cIIDdetTlF5Bjpo%trJIUX@*7>`hz0e8$#0u)sSg-zH9Vd4aTMx0
> zO`>WKg?`Hp$_i`_5T9SLm{gwVQVU-e#FI;f%LPNN4mgzfS2gHKwkk^rq=_8WHsX#l
> z`#u<zKK-Q^U)@(*`I^)qu?>^<)$W&jjmUvO85K)CpaX|Shu5%<uxQrfC|AfTipbTH
> ztY^Y8;&`x=^7!+tRL#wW%`58z`D!jm-WXvDd{LxY)Gex3HLvOl&fnQh&i93($Cm$A
> z1NgR=!m;-4sh4Tt;i3h~lm|*-Kl_SMu{crTh!B2R{0sSkaP+U))<^$C%QheHte?EI
> zexMwS>`HT1_mX<jyuqdSnCf++;ghhKo#hI?(yfWT+P%}R1Z7(3zS><_Z!E_~P8+Qe
> z;j3IF@Ahi<_+#D^TKoegiy_wZcnyO?4cLl;5MuxsKcz7H{diR_jO7U%-hYM66&l|k
> zN9Kt>OEd~AMpruxc5Dii(O@ejlJ^oNa<IkT^&KIT{BIoM|KP}4uqm|4V8fK6qeEm$
> ztc^5>@NXsZ(rQU3Z=7}-$_AQL{7hGn_}DVfdN(AW^!U$br1We4VmA1_e)2W=0kW)8
> zK!jA;eT>YlCr~mxnPFAn>469FpAthgDJ&F+7n#S?A}ZIIi(TYG#+Z_*H}jxSweZc_
> zG%*zI?I}i(U}UZ2teG5JtJ+4%8diy=HJFrrl|H?m=(O22=1Lb6GpdI5q&ry8DF>U_
> zD3SS%(r;56Bn7mrC+&DjB8(o_nkpqadPpzk9>Cl$(U$#Ek0qlMW9&JOv6L}U_%!$d
> zRycYryS&r`Tr$x_UW5}o4Y-7`Dz<~<sZAuvE1AxA5IpGmThu#uj0`wEG#oM$trN@3
> zePkI=J;pi$MG}s>ShAHXC%=&#1&n}kKK4{C<5R?*C%#gjZC<BLeJY$mwc$eGvQ>(1
> zr64TZi6!^B4}P((_!o`d7|fu|9R!+wLxCP<>$2$PpeCx4GfnNVdDO$+sy1{@-bn)A
> z5z+Dd>v%(!l*Ax>+6B|aAR}Ae!;_PXCEo(z!k7vBA$UVq(N1V{NSZh{S!DNtzLjy<
> zv$YRt^9K?+;(7-yEs2|8by9h%7OFYbS=;rRoy<)U{UvovO8H|8D{5L;=N5Z*S6F`f
> zgZ}fiKfP@)0Ym50GFD{E{iX47qn+v|s(DP6swH)gl7DQ`v`pBO-4zMgVe_>u6Za&D
> z7<+_M)uJ#_&FYp{d$A_%S=FWJ#j>XD86u-)?g1VP!VFX8HrNme)0FbG^xkQcVVbsg
> z+LS&0<ymSI)e;PtVNOGZidVN9D^_*s04IFDrZuZV+saq?v|1{BTc=j|wO}>+*rMA;
> zmj;2f`($Iouy+WA1k2#UMjuzAMbKhV$Cr01nUR%bF~DNKV#Ju`&y&j3Zd#bT;%$6&
> zhgQr`Jo;Af{hO0H1}GQ}K_Lj1$ZQjS_}i<2PeBNS6zmHFMxCe8L?~wf^Y?5`mbzKh
> zGyvac&H!P7bpRPEY_P_VI-%M+*!l?Got`8PVW0K@cBsE3s#H+AhEV7_gcKzT;!xky
> ziILR-oL?R<kp;d#`JD^6&~R&*F;b>&uz{q598=MFEt2m~N5E?!EvX!SLg7w|=iO|X
> zHul{l_F+n5J~*53MrKP28f=qY8O_K<a7}IY-J~d>jDDN3GABS|`)>Bz0;*4H=Kfp!
> zu@T4OkD~w_4d6)Nvq2;RyA5%Q@Ep1d8oPgC)M!~-0uomDeF4eEx!%xYdJB!xAxP@-
> zK#U1t<i$S$-m_p91WVx;ioqv@(3QL8C<d=K?Pmtn?1wi7liw4XS1z>5rmP9;M<PeT
> zsX$N|kpWRj1=+TD1>~z+XfO^R+lSxnKVS2c-cw@NLOs>)1Jdu?f^8DX`^d9p2L(h%
> zlYJjpX##e!l;8*no6%bxwAVLnVk;@`yKcV%jp4iQ0Bb>%A*#E7fyxj?XFEVX>w{@_
> zS5JY`$nNeb2r>|+;9f(h;CDVG^M`i_&Bw<7v4t=N(Sc493TEAhCQa-Kh&E0VCOBkS
> zPoq6{PWCUsQMe!WK`%p?nRp0=3n5g#d|#Nn+7#G#q?RxW1$;03d19o{zFH5FIhItK
> zz#^L22B#ZAp~u;NS-#CaO%q@fY&TQT?g=xZPg#eqpw=_Uz|0CTs0wV*Q_oTvl%Ua(
> zM;U#C4lG~{*XR(y8DQu)OKo5ZrW=9*&(Cm?9$A1qfrgh0UNf}N6CBwNET3$mMS8~C
> zt%YNuJPIK5T=a2zqNCPB#!Yg(>!4H^VI`LZTOaARc|sv%O510<8_xel+%Dm)hryFy
> zIWK9Xi}Vn)q2Hh}&a7cvmS5XJ!5KUo&jPM_iS)XN4IPYE*k&V7u)$`A{+W;I0p@p)
> zPdaX0PiKH=BabGI<fk}S(kTuFFr+L9F^~m;hUN66>Pf&r;f@}2hD$knk)d$M1o*aX
> zFQ8K$q=k=DLYo&ySXlXn=FzW+>@mo+K=`HJoZ^Uuz0Qi8;+PpX4#Qg2f__vzH|iSf
> z-<082pMTB@VA7)Ax`yiqOHYi8bxh~jQK^oJS7el1@iN&gu9Q=^j_~3NtGGDlvvizu
> zB%S2|(V^2ulbJpF4V_1SE&n3=i@}HQe`y;X-+8-}ijR?JN6_Tt1}R%|8T$dVgT$4N
> z#Sl(!kn$yEoHas533nD$kW&iIsDKG&T&N7gbqV*MPUVMBRPy6G39@nyWF-M?RTucW
> z<fjCRe?%j!{f=5S2tUHpzd@=3+Og2$=h1kXMsGf#(ItiA5BY*eB4n?<%;4mL4)QO3
> z^B+|TGuFioIR)T}PiWZ}qMFpe4#g?su)kEo$=(Avs+o<VecfHsY69Fo2_O9<DYNGl
> zZT%mjJq)6V4=ZVO)L#QHp!cOhDk4&ha;CbHKt-amNO7a<*%6V46%~;OhtpXT2RXB)
> zA;#MBm{(&uqK)y_v!y6w;VyO;O3rk9FOlfh&C$GWRNN&N`5Tp)jMLVprAu#8t*Q(7
> z4J$K&RUxJ~$|>j04|}Q}J+J5x&a9<Dd2?UPT5N2lLca&#%Z~_?*UxxiXCq{DpiGA}
> z)2`DriidI^%3}E50HFuppFv;Up;6v(8V!T%cn5N2R2bN>D&hS4wz-2rZ>|HY5f93$
> z3bI;rB^qsp9MIf$8hr}w^<N=f761{;MYv69F$V->Pq0-Y{|Tuzm^1hnz=2#5))1vI
> z2j9|hC`bs{AgFYmG%6N$ZAk6yb#90uiv``r*VP#RNQ7Y8_$`Tq;UACahwp<DKU_b7
> zBS)r{_n7q^kO~p<KHk<Jk6>L&In(V{^Bj2h-q9wZf63niFd>{+d8dNNDHcwYM8N{r
> zOOnVYv480R5{Qr9v`~?GL8#btk~}3W5R$M_-YwXD@kG2M_?)phQC$O?y6&P-w7I}*
> zkRhA58VZd1ZW$u8yYrIp+?HkP<A8|m`j$9fEb0WI#a3I|@;6M_wDncoIJeHiP2jc^
> z23r6e7GkA~!@ue;g{*BU0T{Haj6h3ZjbfpC+iNlee_a7+u@JER;|RQI%;msd>y86f
> zJnyp#;n4QUf%VW`0fFQ<U^j<f76NztRR(1~1#Q|<6p0B8hv$W#Ssx)U5$vuDFO-$3
> z<aLBgWgJ;7j{jt+g28hvm!7)wFFqqK`z(;u;hVtr6FWr7W8hYV9iOLK`yA0xPBM?E
> zAWfkO86AIubn-O2e**UAr$E+3!HopJvB^Hd$=R<#&Duxa_HR|U42KL<nqBo1)iMlh
> zY?(bQ)~7{#9=vt8=EC3_ctd7eWo!-K8Q-b@l(-wgv$yz8pG^c0xb=`?*y=BkS*FI0
> z4A-Khj5{6ATRO%=;M>^&Nt+JU<_y=8BumG7SM9^BBwo^)%`U!!5~d|)b|_}g<Vb#_
> zWHs|0a}oojr@r29IBR@7czbxe_==l^U4MT#1Yab+M6AOGgMQl!l3xT8Ukqi?J-9Q#
> zoa-yp+djuvpS4rM%~ZQ70F%Kdh85l!;e`Dj*(7{b&PAUBxMesgCnKL+2h9V7KZ3xN
> zfIn2QvE6b*NO7E$(Xd=#)aB6Ds6g>CI#dNMUeggF#_c*lri_BzGy(s^;Hh{yFF&9^
> zV9qos<9)H*>JVOb!7a#3zzfDSSAY`5BDD7xA>s>XD4vFg`nHQvS3D7~ei1>&;jtq?
> z0?Se%xTkn$bKSH|5|jGuDmWFbG`I@FkiD~H(Z?s&M{>a}Vbk6=St9$WkF_aLq1MY3
> zrts!%p{Qa;^h=;|HXi`z8WzA{d^8c@$6_BBzuCIm!oMqahhp`D(<zuA{A{q}2gmV`
> zeJNxB7HSN~Jk|?7`&$)b?+U-{|A!*|o=|q+ymjnd@0&P{G>G{0>3;v2ot~A}JgKQC
> zpP~rMY^<cG&VulDxe3y_$J)C>%rl*aGlVINvvY4jREa9d{Iybpn~#0t(6r>z8}*ev
> ze|^`ms<LMh$<sz7O%a9dzuJ_xjOzC11MW;qAg>U60`F+8LzNj|mfgzyi=E8vdbitH
> z@AfyQ9-j8xrJL;sDD{pT*G^u2{@0UU<E_Ye!tJ=(x_jK=jGX)&j8k`jp5JgsH8i<O
> zZ&S>Vztdhz&R28pjsX3i0MdR>%g5j8$s2hmz8alYLDr%eFdz*IbNq%5t!lSfgL2S(
> z*PUTp=dDgx&wPEY+x3L=<#ab2T`sQi4)MT{bniIvAUmlCGWX<Us3m&VI-@c-yff?&
> zyZa?htm7fU!=7Y10<OGqto@z_!rrvgA<kO6BCWW?_cl|ffxwvX1gpGx2EXV4Cs7|D
> zL%?ATmYO&m5KvV5wzSeo;H?hM7Q(Az74fHpm#Zrj2fIb7I+P6T6BI36(ZOyZQ2ZQ*
> zgahKcxCyN(3dF7izDs<Ec%)`yDE`FrFbK;Z76TZXaZrlu8|njN6yh^*Y#(|hiGn_s
> zBtU=n(AL1y5LM(ohQCn2f7x<Z@IAaNc<}Ea@9^Z)L2CWMC<bVC!nVVs$aeAc;XpDp
> zw?Sfl3O?uG@*bDKEuaaLDQ6{T7dwxPBS9aCasL=Xl2O9+ug78Su<`4u<Urx_*CWUv
> z!RMP%q*567&D*3(5WX1)!QGGFjEcnD*o;jyYy%5^6aI%QhC(&4^28n?^60Z*)H06_
> zCEJC?M~^{0_S+F;xRCShHXl6I@D_vG1=V-gVC2?!7l3qK?L>$kHFeKKw8O)gvj-x9
> zv1*ielRzP$Gp>Lx04`JNCX+B@Lw#5<rh=iE0gSbm&<Tg@2S@xr$AD;HYHpbDpnfYE
> zD{eRzrF`pp0Q{u|e_Ji^2ipPqsuK>4hVMGiMJ(u~%Q~-qD)rIHI%-s)4kZJ8Ec^kO
> z0PP@{7Xs}?nA;qxL;XPSE!GK&?-P}V`+>sq-w*mDN!gc>gbYGU8boht)sUxvWXPl{
> z9_J}+tGFkYi6Xim06{-9pLJ<kQbGKPoD^qj&BnGF{O4y<YBse&GSX9grnc*2oJMhv
> zjC~pYZPj-LnzPQlD8APgZe~66&Wsb0C%0{a8F~0KV>95x(Dtl}=zgs(#nxl)naoT7
> zo)vF|IPBC=kua%RaS~I(+wLo2;n4YmAsg|;GKkKy_3;0mQtWyH>G$EV$X!@sm=JI(
> zEGSl{IMf{CB)aF<GeXj-)baQh@b&j48;r$D^lK6*H@yzUf=|c~0u>siL%%^e<<Ov?
> z0l#)2{EG+hIXg8dRy=rWp_0@K!y8tq^<Tj?1q#lF2TJ0eR@m403A7PH`VUW(`g`GG
> z`j3MYO2fS<A+LF;8ZsIn5W?2xtqksByQ2`5;BFb(EMelyEq_*q-@ge;AByECh`_Hw
> zAKF1+i-d;1#E2KpJ)(vwNP<Wvh-+gAvw_eP(?~r*D)hwESM<Y_fqIgCRzHx1mJp_m
> zjV5b_g=0skqHC8oZx!CoiW082Rrn7asI#ZfCWueg?obJ%#<AL-0FszaJ$e6s0Z^UP
> AKL7v#
>
> delta 5801
> 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
> H$J_r09%r(>
>
> --
> 2.17.1
>
