Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A48C27C4F
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Jun 2024 11:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 51283C4AF1D; Tue, 18 Jun 2024 11:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B313C4AF48
	for <linux-firmware@kernel.org>; Tue, 18 Jun 2024 11:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718709871;
	bh=UKbgK6MKkZUr/Z/X59In+39FF3T8HINUC3M5d7bWVGE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=CMpU2xGEi4lvhs1PM2RUJpm0bBjlcL9cLuO9u53Sz740YNcFw28IaJrLh4mG6YRGM
	 7AAH5Fwp41orplaBmrMqOavR0ipAeX0sDwraFWvxk9uxGU0vGQOQIFlg/+EKp6bavB
	 SAHNy8vB9VC0emr/XJ/00EomWSmXby+k9PrKuG7bOsq6XhCjB1W7oJ3B8uQ8NbSM2l
	 UH/zui5pBFKHDGlFp/FQvkvPwtdMOuSPSpe7I3hkAzVEmo7DX7HR8IuFoNXUTXywXk
	 FbSQPHOu/lsxVqblCf45yl7/d/tHqowXage78x2huMfqWG8LVDcQ+JLQw45HGOYUoO
	 ECEdieu2RA9Cg==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-63267c30eaaso36388587b3.1
        for <linux-firmware@kernel.org>; Tue, 18 Jun 2024 04:24:31 -0700 (PDT)
X-Gm-Message-State: AOJu0YyaeQF3R5v8fVv24/PpM2BQqrOhVNqJzxduu/TsFGRzphp40b7z
	D2QHkC4LMSky7kQEeB+8BO7BVm59xEsljpTmkVq/OKArFYsuBb33T3zaI51wUj2m+IsTNQ4dB/L
	7ixqdICHELTpvJjEEa3T8/My1ies=
X-Google-Smtp-Source: AGHT+IEuUwxRIdpISwOBafIMpFomU5jY26N3aCWGS1NSN9OC8HilaWtKx7gj5XJxt8DgTO23Dwm0qUzSOP/jO/QJvCs=
X-Received: by 2002:a81:8503:0:b0:62f:cdde:360a with SMTP id
 00721157ae682-63224a0a19cmr111936887b3.37.1718709870335; Tue, 18 Jun 2024
 04:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240617064050.3236670-1-hildawu@realtek.com>
In-Reply-To: <20240617064050.3236670-1-hildawu@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 18 Jun 2024 07:24:19 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4AN+ZiFfrY+JcsicKmiiRDk2epP=WKwRbX8DdKKUw91g@mail.gmail.com>
Message-ID: <CA+5PVA4AN+ZiFfrY+JcsicKmiiRDk2epP=WKwRbX8DdKKUw91g@mail.gmail.com>
Subject: Re: [PATCH] rtl_bt: Update RTL8822C BT UART firmware to 0xB5D6_6DCB
To: Hilda Wu <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Larry.Finger@lwfinger.net, max.chou@realtek.com, 
	alex_lu@realsil.com.cn, mu_hua_chen@realtek.com, kidman@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/231

josh

On Mon, Jun 17, 2024 at 2:41=E2=80=AFAM Hilda Wu <hildawu@realtek.com> wrot=
e:
>
> This firmware patch update for Realtek RTL8822C BT UART controller.
>
> Release Version: 0xB5D6_6DCB
>
> Signed-off-by: Hilda Wu <hildawu@realtek.com>
> ---
>  rtl_bt/rtl8822cs_fw.bin | Bin 63616 -> 63936 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/rtl_bt/rtl8822cs_fw.bin b/rtl_bt/rtl8822cs_fw.bin
> index 4061aa391a1293a9ab5a4531081a5fce2c1fb54b..2676a7cdcee9444073a42b328=
d55fc69b1f1c005 100644
> GIT binary patch
> delta 3703
> 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
>
> delta 3430
> zcmYLMdstIP7Qb_E5<-Y^?nO|j;VD+*o8s0-yI=3D72L9tz77pvGuf?^bcR*+q-RgP`3
> zYQaxBh>AiZ6)T8a<qBF>D|Smib*&bxR;*gJ+G+rsDAd-+x@SV!{&8~d%$&#XoH=3Du5
> z(sWM(uN0b+VRtUgn7d$w^?YARAc81pghvxfo<3BvKeQ%e?14BL(gg+HK(Zk%+($uw
> zNP&5J1rF&HI95;L#YPIx;W+sqg)T*bt?ajq@O-(M!j1+C$8n|^`KdJuEDw_5kx_wc
> zvkX-qQ-DAP;?Gi8hJ5823a=3DnfJxyU&sshg+qhN1C%P4>O28CMW_Dd8rCe*n|VR&B!
> zZhnI6$n$C`#8Cyt{FB0H<SpOQP`J<s7eZt>Rz+c+R)K2dvrt%O`{(!1k8G!KAQ(X(
> zr_c{qyAM;aq5J(ODQv-UGV-+;U_mQ|1*oNMq2NK&vypcoU)^5@p`QZf!7^Osum{Mn
> z6vrzu3B!@MV5rqd0}TqqpsmrEpn`rfwB4kTVUW`y9t}T|F-`<9{xb@1_@mRWDHt)%
> z<`WcVpkmQ3gpS6m_ET8-Pyi!lemK(BQxtwhxuCBo3`9N-0h@=3D(@EiiWhIt>ycR{Uo
> z%+chBsZHMPdkmRP-c@_%bP&tUTZ(&5JLlAGu?WuKx~txuWh84}hqE&@M$9$Xq`yiw
> zlH1o7NHw`Sn?BdiW};2rh8ivY9;y-Xx3NYWbJgoA%kISAi#oJ0rEFS<6h)>-yz;F*
> z;+BvhWLOdAqq%-;kF!`yswq6r;<Il{dwvOKBNp8k=3D}0zsajV!_tv*=3D1K_ZFjy4;DP
> z!i((?QtF=3DQ_jtj57N?%in<nOuucN^26=3DCru6bmp932mqATC`tJsdePU+0Avf8uLDq
> zWIKsiwpgN`s<XO<jH_Pj7IT!aAXvTXwQVDrQ*JrkrYP;KNGq`qvp&h3ep^AgV#ky0
> zVh6=3D9W2X^gv6f*Z2@$hy*!6XowHm@cS{A9Dtx`C_zFOub;q2)0kYtNJWZz_$U(^89
> zd)qb1Mbc(DCN=3De|E36Fi`4$}^QExi}ec#;6Mu$v|s1Xol#1XixJ`HP=3DMD<+8X<$>|
> zd|G|u&Cw(>u`6Ja?H6TnJpJ1i@`5o+$h4@MR_$3`tIqi#JFzQ}9a|A2C3Zc<Zm)P=3D
> zTGwS{L*E*ODOJ<nIxR|xcPSf|e~qWu1ZiS@Bg=3D#|GMhESL23T|0W5#@k`Ovlh7r^J
> zV6ZGS3_-FWmE!@>s{U{PB%1r-a@Xvh13y%+gU*LqnEgG0$kPPkS)YQJr6JuW<|v3p
> z9>j_Yilu~Zvl_YPUqrgq9mu|aZzA$gW?nnj(CevfpSpgnLP)t<zAjLd-tz=3D7_5IZU
> z19?1Gn=3DbisrQIz2EX}p6k%ec7n0QCMTeMG<V(uGQ)y8Lad06)t=3Dk<*_M9T1**~=3DfC
> z<8h8;KZ-{JS#U`TS;rQZ92Ga+XO>N;IeV}vMHi1pJ++;sl$Mc&tg|#+j0t9@%^Re5
> zJ>l%b&32wSaZ4~k6Kd$zP?03EvD=3Daikw0NR3^H8PtLwLYKu8~EF5e+dzN=3D-&%AXA_
> zz?D2K>ykzV5y{{@sQ5A(DKMoXO`3E+kS(s5+NU@C6WGY|*s+RylFH&g{GKC=3Da-Gzg
> zv3uq*uPacjKdS0>m^A6xI8*Rg3o|Y$aPBz*V_ucuUG!o86(h$ZV3%buW7k`ab4T+1
> ze8=3DH2m3>E|`DY5*_?>_qBW|1mJF(?(T#p}MOT%W!k5IOW{k<w|6wmjR+6b>P$6)uX
> zv({L%oNjHD&bI?3lTabEXCKy}o6G%VmbA<K%&}_}Zfiw&FgGCG(Bh9LPvd|tA;;ea
> zUH&=3DXAvW7xn&a{W*}kC>+g*1DWEQi%yF&6`vT1VvY-^%{x#6}WbY_{YM(Q%<>g-m}
> zj7kyZ1MPm)nCtTN_070E0hWBV;3JZ~KDO4qvfkRP%}jC^x~Km8L%Kqpw@u6qum@(7
> zMavOu<l<#@P__)e_B+0#OUqVI29I%2-T{*B`XcXu?Gnk#YF|3@;yW}T4?Kc>X4(85
> z@s)l#E9|=3D5<@QCWrprcHdAatbWjiM8V;uElQB$*{-geoico9R$TGlZ~RXU1)X!0!H
> z`Fga=3DlTvBQvDgebv)Sd?{`oJ`z@<rcpPYO80j0g@hmvhOrs!j4_$<w+hs(tIen-i7
> zJrYw?#hr+j{!%$6Dha(4=3DLq^j-Mf{RLGwOOtmi%x>gJtHz?G++5fpa1yvEE~9aHO+
> zj^rD2calt}J1FY)?SYopw#ybkJe1|{4$7K<@<K+EWjykYjw!oscl%~7au2uIwrE>*
> zt(vn(90_|jR`t!A8S8Y1XBD=3DK(Yjo-ebfQhPLfsIJ|MbsdvMHfRZ~*ft_(wuNz2?Z
> zh;!lfcPcd~tsmA@GnjjDO3oPeWVbmy%;(R)&RU5DgBzvEEW*tR*lZ~F-zfa7V-u@~
> zhVW_~f~6w}5yEujo9^Ry0^Zwfb#;F{0$Zy;u>@VG;Kh>4!#i)ucNDtuP9J-j!d4t_
> z@{?igH>eYX7xEdFQ*&in_m6lVYZUO;%dijcZ7-3b1h2l-ZVKCxFZnOtyIADp9^SRc
> z`TZdX0<1;%i3q0_b@qB$>7GWhQ^QhfU*N2wc9l42q#Cx@O~mfus^OCq9q$IO)$0iF
> zEAtyx8D8z6aM&g6tMafr4GqCn9_l+&1BuX3h;Sm1qh#a3kzB!j(9PNTLob=3DeAP(Lf
> z3XzIBSnQ{}_{zmkV|5YOF7momrE#!mibV9iJ)$;_O*_0sHyW2wvh{E*?-IHrtGM2p
> zBhxrLeIyN;YWZv=3DF^nG}LqRU#vgt=3D(GBp3z1MJlf)`-JuJoCT9R+>KGy1SYzV(LS+
> zwP}(xxYs4`Ae|2>jJZo;Jtnab$$U=3D$zGuk;*@Q1DxaP$#D#F%1=3D?RBxv~^NUEfM&x
> z@-WR^YH72Mn8pvnt-+TF*G7~zU)~|FrMkJS#wW|Klpf32qwr}p18M9)9<2<#(X<IN
> z1YsE2LkR@o(~0Bf$aoLy?TPEc1z(>n!fo+(uwRZ>DqN*EAfJgKwdO<^89eCswp@(u
> zpBLkJO^+LHe(xQ8T;9S$yU*^NOjCN*IXZ5xO<-yNxf0qtJ>DfjUg#g%V{|O#REoId
> zH@53km{_i3U!H0V?nLv&+XNrlYh?ml7{#-|O24`z-qf=3D-ryE7BL7jBwPoi=3DYOPI%W
> z0{lSO?z_>}w^R`EL>sf5tr1&{>iM&=3D#MJ9uk0LEb7JRM(msrEO`J9EFFE#PL&uwuV
> zIQ9AY4Z(cK_4pLO;JF)In*Xia(!10<%|(QA+`Ya%xHb6AaijQ~7fMYx1MvN-$l#9@
> z@6W>8f(_U3F?}2>q$))Hb6cy(D^a-=3D$~hZ(B}(~Y88P4qOdhJHUr{tO+rse`j1S$6
> zFnrx%d0fLxQXJRg)?2XzTB3W(q2MXmR}wK1GQ{Eh2>g>U8o7*m{g7Wk-R2>P2+M3?
> zG&^}cg(C?2A(l+wA@c)&Jg(;!wiilp;~51!&tQ|l2jzv)GK|CT1xUwt;;o7D!*Oo+
> zXm$M!Q6nZts2grw*YHSkI?H^8EUHpn#4X!J`%pFX&Uwv%b&n_nA-#B;!rsUDhDUBk
> hVy9k@R)^i2s?#^l{Mf{ajhSfGKj}k+WX<D${15j=3DH4^{;
>
> --
> 2.34.1
>
