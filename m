Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7740C432BE
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Sep 2021 13:09:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BEC3C6101A; Wed,  1 Sep 2021 13:09:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A86EC60FC0
	for <linux-firmware@kernel.org>; Wed,  1 Sep 2021 13:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630501779;
	bh=BbtzNCABPWDbelamhWan+MqXZyDXqlmx5Saqn+dfxIY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=Sz1r8cQfUuJwRjKJrxeBKkQZzlD1zx13nmtucVXo1c60hEWI7jIkmPpm/TdjXaBv4
	 8j66teTB4koX2VLvSTE9BbNfgKJXWgNXSKOrbJ1Hc4Quv3gCJRsNOmwwJxv5qr6BYl
	 dNNmc7hXYieB88OJL4N/dS1pu+7rSwhSiZ3ATDSWo+BI6Ya3TRjHt0NsiWL6aXZXAl
	 r2dn8Mto0tUbslnIRrLw/DVmia3VnuAcy0UjM24lUs0T/mRJun1eUd8RgwnDs8kRxA
	 gixMAnlzicI0phTcrlqCX0wvgt/iU5We7k+ogLTMg8TSfrl4xNLQ7M9B9yj7ApbYie
	 YMy7IzTrsjcow==
Received: by mail-io1-f44.google.com with SMTP id j18so3860005ioj.8
        for <linux-firmware@kernel.org>; Wed, 01 Sep 2021 06:09:39 -0700 (PDT)
X-Gm-Message-State: AOAM530trS4mCDeFrJrPDooACTdA9iwJTbLEbCXL12ALnpBmlQ9UG4dx
	ezaPO0JG4dVHx0aiQgw+We9PirES4uvPaDhl2hE=
X-Google-Smtp-Source: ABdhPJzMzMERknuzS63I6hfpTapMDevHDdHjcZf2QjxdsSEmOo5A2dpkfmbVNwtVwNHR+gzhgTfJxZzhFv52Xasdi30=
X-Received: by 2002:a6b:7710:: with SMTP id n16mr27373548iom.101.1630501778993;
 Wed, 01 Sep 2021 06:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210901082537.20363-1-hildawu@realtek.com>
In-Reply-To: <20210901082537.20363-1-hildawu@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 1 Sep 2021 09:09:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA46htPQpSh7zyKVPBm6G3ZKKrqp98LjiS8a68wQ4+Fyxg@mail.gmail.com>
Message-ID: <CA+5PVA46htPQpSh7zyKVPBm6G3ZKKrqp98LjiS8a68wQ4+Fyxg@mail.gmail.com>
Subject: Re: [PATCH] rtl_bt: Update RTL8852A BT USB firmware to 0xD9A9_1D69
To: Hilda Wu <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Max Chou <max.chou@realtek.com>, =?UTF-8?B?6ZmG5pyx5Lyf?= <alex_lu@realsil.com.cn>, 
	KidmanLee <kidman@realtek.com>
Content-Type: text/plain; charset="UTF-8"

Applied and pushed out.

josh

On Wed, Sep 1, 2021 at 4:25 AM <hildawu@realtek.com> wrote:
>
> From: Hilda Wu <hildawu@realtek.com>
>
> This firmware patch update for Realtek RTL8852A BT USB controller.
>
> Release Version: 0xD9A9_1D69
>
> Signed-off-by: Hilda Wu <hildawu@realtek.com>
> ---
>  rtl_bt/rtl8852au_fw.bin | Bin 48620 -> 48884 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/rtl_bt/rtl8852au_fw.bin b/rtl_bt/rtl8852au_fw.bin
> index 2ad8cf4b55bf23ae4e90cb0f8475bc17d4a154eb..cff0a716322c5477b6eb7b9a9b0b18ddc298f96c 100644
> GIT binary patch
> delta 7280
> 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
> K5&-~F1pRlH&7)ob
>
> delta 7125
> zcmV;`8!F`V{Q~U!0vu9hVQh3|V`zI4so4Sm0RRF3zzJouFaQ7mKnj!b2^6s~DGWup
> zvO$`-v$?TCG=emM%eb>Z%eb;Y>HuZ8vOwwpWw)|G>HuZ7vbVEf+PAVr*|)L)@l4sa
> zvf%JU*|xK`vS8Y_vbVFhlb#Gg5U8`LvS8Y%vZ=FR+NrXsvy<ZtOE9yrvS8Y<vOwwp
> zWv{Y8>HuZ0vP{{pv#+vX+OM*(vtZh=vaqvY+OV>*vtZh>vayqD4M~5Xv!JqI+Mu#P
> z>HuY+vY@kI+Mu$bvtZhxvZ1qJ+M%)lYhcQ8YGCk7z+muGz+muIzyR@Gz?`yO*?w!B
> zvTN(W@J!j8vS9FPz+mulz+munzyR@lz##El*_N}HvS8YmvOwwpWtOr)>HuYyvX--8
> z+Tid_paE;Z@R^`(>fn<$4jBQBlTZ#9e~7X`qQLNZz+yAN@Or=oYi#NUas^=l^Z;yv
> zvOwwpWrDJTvtZhSvV*f=+JmxR*@LqHYCy|^vp~aww1cyN+k>-%w1C@#vxKyO+k~@(
> zw1C@$vxT&P+l8}0!-caz!-cYivtZhVvWBx@+92^spa*Mf>ul;E@kzjfvxBl=f7*kx
> zgR@}TgR+FPVcLYVV%mhWW7>qXWZHzXgtK7UgtCRRW7>tYWZH$Yg|lGVg|lJWg|lMX
> zg|lPYg|lYbg|lbcg|lSZg|ddTVA=<l29X7j0Ph52e3%h{ng9}jKnD_lm;e%haT5`M
> zwGk13?RgP^Pze%%`S1{c(e@C4f8GBOfL;F(fSLagfCv^6fV>tGfDI54fT#cxfbHxM
> zfNU2MfYcTefN}2-fcy^<fE67PfDjQ9fZZAqfJ71!fCV=ZfLsz1fN|^)fZz}kfVDLd
> zfEW-GfNkv%fDjN8fW_?)fY1aIfEDf#fUp-5faMGkfOHoUfZgm6fGiIZe}Huk5rBvi
> z5`ZoC5P%dE5`ZNR5r73M5r7aB5`bM&5r9!{5rAzE5rA#*5P(Dg5`cIT5`Z!75P)0|
> z5`d`>5r9k(5`anV5P)D05`b;)5P&%i5r9w-5`g`35r7OB5`Y=+5P(<{5`Yo)5P(z@
> z5`bm*5P-n=5`gsy5r8=ge-VIv3K4(}_z-}A6B2-N7!iP-{s4d|5E6jB4H19<000PZ
> z-w=SM7y*D>1`>en`VfF%1`>cJ{Sbh;01<$`_!5A;_!5A1j1hp?3=)9&1QLKn5)pv(
> z1QLL`5)pt<4-$Zd?ht@r4ibRL?ht^a_!5An_!59n77~DE0}+7aWDpX7O&$?|2_g}I
> zs0k8)q!|)`5$_OySPc?@sYnrktws@m`6Lm5%_R|lxET_F-2)MTd<7DK)esSYQ4kS;
> zYzY#8i9r#7^+6GUtw9lhAwm&=(LoV_!9o#$T|p6m7#b3QeUnNNw-I%V5r6}-0Bc~v
> zAm{*U0A&P|5)yv`%~!LN5*7gh4U4m@6FdO}V)Yx7>J*;>+>Dcp6*>cB@B)*_6(tJX
> zj1hp*ItYM0i?jC?z5yKq`4WIVegS~3eF1<7HWGjU006e|1QLKjEdYQ3v(gtM0U84N
> z5`gdo5`bad1Asv>0f7Jb5`g~r5`g{qlMfkA7614Wfd2RrfIu`7fUTJTfc^LqfB=(n
> z8Giu)v+@}S0S1YS5rB1zlm8kz0#$O8I~%S7RdTcI8#)0Fb&C;zP#hD0RapaoiHnmn
> z9n1rR^beB)9(@4;lYk!80RfX%AD;r;jFa~t=m7$=;2=c-0^E#~UnC}zO(Mtx!}bcZ
> z;2=c-0^E#~UnEur`1=xo{QHx;BsLBO`4WKrmIZ+L`x1cs`;-49&H)9J&Lxcl1NRV<
> zUM67y0h7Qca{&UAG$*+wzW5S=5)lBl+>8-`(K-l#G!X!{I1vE0r~ndxzy=b4yap10
> zyps|ruLETD4wJ+vIRe~_lm95*184FCv*0NY0RyM<5|i>OWdq0Z5|dgh9|Ono6q9@_
> zX9MT*50mCARRag}4U;}BB?E`@5tC*tqXUQX9J359-2npJjFamwDhE-F5rE-~5tCpq
> zL6coC^aJ7X46{@)odE*ejFa;*Y5@e3UNTn$1o8@#xH2UI+>DdoGBP&f@fL3SZ9wY*
> zYzdbDY5?yAV*+Xh(gA7()CAHl^$>64@fvRL7a-^WY5-*z91?(~7y*FXjFU$*bQ=~T
> zDzZT80c<L=K%yRNZ0Z7XG+`*PK<EK%CzH@K8zAT+A+kW~0A=JNAhJN}0A=78AF@EA
> z>LMPpK<WTx<|303G!$l|@*HmZZ5gsa>H%y(=mBig7eMeypg{15pdo8OGL7nN>dGPx
> zmJO5<vOwywXT&NHk^yUA!U1Z)7XW3b01|+;!T^9691?(4mjHkn4-$a&9|3@QB>{i~
> z01|*zzW{*I9|3^ejFXEr>H)&Db~RH04%n3ufSu|9fFLCjfcTY@*ETLG#P||`1+oUS
> zW7-C@WZDL^Y1#&}An0n^#P||`CF~G@N$e1S(eMy}<&!QqYY7Pw5rD+_5`f&3qBmO!
> zeG(CX#P||`+>-`4a~|Om5rD+_5`f(J5`g_<1!4oTK<WTx1(yKt17rPilb1L=148l^
> zlh!ylIR$7DfQb7NfN<UtfZU7`fYCY#fYnwJfK;4eLI@)UvjJ_O!v(WI+W~4z>Qvky
> z=m2E^W&HROfcTR}Ig=6m_!58|kpO_K)DnQ~SrUNwv+6l#0xJCY5`ZBT5r9w}6M+2_
> z5rB9y5`Z995`aB^0e}Gc5`ZZ=5r6{u5`YC%lY2a}1ETN&lQ2C&CH)f-fV}t;fIOoB
> zu>b!70RImF;M|N6fYCY#fYmGnfc*FpfFYBXJ#!X-m=S>R`w@VIm=S<gt0Ra1`w@VO
> zn3Eqq(gP#&5|i{kT>{*UlT$xp0acT>KVg3lU;*?SS`1(S^aXNzU;y+Pa)9swU;y+1
> zaxq{4Xekf@^d53}XM7_e^dE9(U;*?Ta(HL+D^9jx@d~B_YE0-DAWX0TYzNao=m^$J
> zvOwyQX9$)C(qQq5ra<TbWd@Q5lYptBX9Uv#Z$z>{>Huy5Xi#Sjmkf~$kO1!oV>}MB
> zVDU<#8zM%e1zH$kJ(HS1F99`^%0Mkom=~jG6l-nm|7(ouZ0)V;?-wYt0c&8wj29=e
> zK<WTxCb9u*V8SM{K<WT!trsG)K<WT!sTUNrVDSp20cuR>qaYHt0Bi`;3DrRE2i6^v
> zMnNAI39>-y0B(sF1Ec|JOz4Fm60*}50A-VTK^z&88WDgX0RXme-V%W51QLJ*`4WHu
> z84-XGldeH)6<C)MfSu|9fN&%dfN+-)fDj}SfK`(&LeGEE6cK<uFA;zl_7H&SE)jqk
> z@eqJO6B2+#6B2;6@(_SH6B2+;^bmlM9TI@)^ALc|^bmj;7ZQMB7ZHGQP!WKLDH4F)
> z^$>tX_7H%C8WMov5fOk85dgNe$^(EA$pe6)91(z35fOl>_!59Xq&9L4Vf|wTVh6H7
> z>IQ5EvOtr3LlFg`91(z3vywv#0t0689+RL&T@ra75rFZU1%L_j1%S<(1%TX)lMhCu
> z1E%p0leR`v5_ujGfbp6IfC=*jfX$i(fZU9e8%H_`bsrIc8AAnt{j*+2hXa2}A`yW4
> zV+&#m(FxEcvJKUM@?e@kq$Fn#Y>es$at_usVMjsXnFC4$(g0{TBLQke=z?c#>@6gK
> zr%&ok>zXtHYE0}5G6~`qwMa5q<zw*3rq1jhECiHe@Ciy)<pypMvIf^c>IKsUlLnU(
> zDiD_qmJYJ9XF%$ZX8~#slK?8i3zrI!36KEq24g}&1k&+m%ohPj|7uL=6j;b%0BY_R
> zuwN2@*pdK%Nwbnmg9HH(lNL}le>kzkXE?A2Z4&BD;Rn*d@JypX^7N~~@Ry?q(l2UQ
> z?he)x>ITvQN(tiN!s0jK!V>CT;K1-uqY2kT$1Adt;y|P-w29(Csw%XAq(U-AGOX%L
> z<VZA&;(+jmt3<~ovOwwpWeJx6ZAHfik|6SgLXqJivOwxOWeJy0Y)j-v8pj{BS!Y1%
> z0B!$mtm+h64we9H17H+vQ{=3Z_E0B85VAn(1Ox_>1eB*j1WgUHK<c&N4VMg&3y=Ws
> z2V+ni6Mz8x5r7o22!H?p0JiA`5`fh<1c2d-5r8aJ5`a}%1Aujlvu9Ca0X;D+5r9Oj
> zXL5k>7Ge8i31SG*2hd8hK%@U`0ZNSOWOA5iM<hVQN3cMs;PVMu0ZIg6MY2HZ0A&Db
> zK*&RrZc`%zW+OY3lv5=E7L&SD9}NkY2$2Vn0Ph83fWx?x>{C4w7_tP@K<Wk61(g=E
> zK<bfa1e25RQywp^>arpMOCVduVXhaz@qWU<@qfa&7a-^WW%T$GfWY_?fWd(gfB^gv
> zfSD%|fN_(WR5JmUv(8i>1PT!Y5rA;s5`dXvllNFEe+>B&fCW?$fWr6^fG`OXfX(Xw
> zfN^aRfEh0lfDri-fH8ImfE<wkfW>POfH;u=fN^dSfcQHSfFM>9fB+2=fZ3V=fCZZX
> zfTR!-fG7MBfQgF{fOU%zfCX<6fVB7$fVE2qfbp9EfI*u8fB^XtfCBjvfc;|yVhOW@
> zXW;P&lb~5GI#04d>HuX=wIJ|HrB1T}Z|&+J@Jhvis{(3E>Wu0@%SyCVYh7n_!b!3q
> z@O;7rYXsDe+F<cy!bY%@4O&(WHM2nL0A)3^K<fZyG?Q>z8v!trj9M=dCbB2BNbmq@
> zfSRoAfZBkXB$LcqD@h%)0Bc~v9kKwz0NDwb2$2Vn0Ph830A<}X5rFtR5`b0^0Jc(8
> zUqT>O5`d@x5`g^p5`g&l5`YBx5`gVg5rFk=5r6?`5r8$5LR+f=4U_I$%La*y5rEw@
> zlfPU@1H$kUlL}oY5!{RsfYCY#fV~F;fRz&wfIYK9T?YXg0QnMtRXGHJzz`CE2sRRc
> zEBq0FiHi|{b&Hc@UOEMtR}p{;lcHX?1H|+VlU!dP1H|+dlYU>54dplyfZU7`fYCY#
> zfT5EfVDSUy@&%I;VY@Hfj1hp*ItYNB>HvW5V<TcB(IL<PYJF!V)nM>N!$71DYXoO(
> z>IZV5@B(251*4PxVPOG_lVD;m0f3W`Vi{jsU;|lCU;%N!@E2eKN&jk0=>=KnVH}b!
> zDjSk5B6G4p@I`_EQUhUfvOuCFB0!)4ZNflWGED7nvOwwpY#?#~YZ_n=YG9xmWmsoy
> z>H%^RVSY1dv;iw=w5LD@ZfKJTV>e$xq#D#6(nmxAN*>ai7XxvAU<7fnVHpAh(p9n_
> z(?psR5I~?0Y>eswa;0D$k{*=*ZA|S322Zj;>L1e|lba$L0tC`ZvO=0Al^T>_@C61y
> z>IMfNlaC@kwP5l|rHhlsV^tF;vq|HC@=T%uYf3U~>HuqB_ZO2cWGPq}vXSC|@=T;k
> zGpy?bD+Ft8>VWc0!~kj=(gABU7eJsuY>etZ_YWc&0tC_&vLDk!nvxelpbu<}>H%^;
> z_XA)V0tC_yvLDkynuZr$XF%|Hq96AdBi|R3v1BL$l{%B#WOf4w@C}nxWitZ@@D-Da
> zWmN+w@Efz@WhVg&+>8-`(K-l#MT(OXXCeU^lQw5N0`WeRyJsQ-T|tw(XCeY!L6f^@
> zA_84Oliz150`WeR3ur<EM)D7nP-syK+>8-`(K-l#@jjEQXhs9Y_X(5qXfXrD_YjjP
> zX|Drj@DP*QX(<C{@E5ZNYIOkvM(_laertyU+>Db4Y(fDUvr24N0SRqJ5rEi|0Dwu8
> zs%_r_ZAO!eZo&n@M-hNYlTvR(e+c;!fQb7NfCRHcivuG6Yar-s>LBPuqgeS8fFrYy
> zqX23pBmisxY9Y3r=790Br~h>jV4(5or|32H<<RixMC3R5=D@DP?E-B9U;%Bd>H~5H
> zU;#}3ZLI7DT;*W`B0%s!!$9yrqXTS=>QFKfw1T7rTmfMNY(H(7G_2}ClT>gY6m9DN
> zYar-s>HuYM-V%TyRuX`S`;(7wA_9o}le2K91`PQUfQb8(UvU}%0+V`i8v@*nlb3Nk
> z0RfZLaV-MejFSU$OaTa!P;xN>+>En>atZ+gi2IX|b8Z0&lm2r{0SA*xbSDDbjFWS8
> ziU9zV{&Xh^Sosow&FcVwV3RI&7ZRmo5rFZV0DwW80Dx395`f%{lUH>r0Th#hbyor{
> zPm|kqQUMf`E_OEpsZWz<cK!lcOp|AKmIkF`5rAD$lLL5m7Kuy|fL%=yfU!vtfQ3pC
> zfW=7>fL%(Hk9eYgMNScbd;k)FX-g4+fB+JJ*-H_C$PW^Ljad<ZiDeOh%nuTPB~lT9
> zfDjUZ(OeOLgb)&dIZF|M+yoMU%}o)23i%R%2>B9#X-N@)G#V0sT~QH$EE*Dk@l6qc
> zP!ke>$zc(I5cv{-4*3#*aNZJtEcp_E=noQry?YUW><<zXfYo~ufJ6oofc;MqfNT>I
> zfKgAA!+CB3sQZ&MdLjV~lU8~k0W6btdQ&wHZvJfqYzeYJ>J!NemkN;ykO1!nV*q6=
> z`4WH#2NHk`2NHnXj1hp*ItYLQvLNVGssLpylm2=i0W6aqdoKx@Q4xU6R1ttElU93M
> z0W6cUduIiR`x1aGlOBAZ0S%MBd_w}<jFSU>dL4-S5`Zyw2!MrE5r6;y0RXA+0D$#X
> z5rC;L0f1POntksBq4yV)jDATa0dCqC;a3rWEcp_E9035f=mZjg2@(;2#P||`+>8-`
> z(K-l#eUtirbpZjBaDN>x18)9p3$j4!1#AFn#TNi&Ecp_E5m*s`aNZJt9035f=mZjg
> z#P||`eG(CX+>DdEe|`ZBlRAJ|EER4C(m<RB(h0H!(gJD((#sc-QxSjw00aQ3@Bo0!
> ztpKnr`4WK1SP_8SjFZ2BJ_aoL5`aZilLLWH0RWRyfj1J|j1hp*ItYM)dl7)CF9Cp^
> zdy|`iA{s*Q7H<A+2C_iv1Z)YH0Ph830A&dI5`f%{lh=Vt0SA*Jf-w{gZsr#NW#|MF
> zfdBvhe|iA`w%m-9XM$)0BJdiM(t;-f+>Dd^f-C_5lPH6i0Sc4AgE>Onj1hp*ItYL<
> zb_jr}S`mQBSP_6-ToHh2TM>ZKS`mP$TM>XgToHh191?(N01|*?91?)Ndl7)V1`>e4
> z1`>eHRFgY|$^lrD28E{ri2Jjzg$e-{El&}E{bL1U1F}Hs0A&T20Ph21sZW#7hF%2}
> z`4WH}lQM@V0Th#3hc^<PU=e^Q`4WI|-V%U?_6C3jVUweWQUWPqllO;u4k`H(fN^0F
> zfMG5HfDu@ee~3x~abc6oh(-=6`4WIlViAC0E&+fMSd$-#LIZ;HACqK>B>@DJiisfs
> z50k8k84?9y5r8Q95`f%{5rEM;2!Nenlh=u60UMJ(ikl+bj1hp*ItYLbUJ-!RUJ-zW
> zUlD*wU=e_+@Bo0(Q4xUcVw3xdY5@V0W{WEdEcp_Er~ndx+>Dc(iyi{WWRts#!~qSn
> zfQ(528Z7w|fZU7`fYCY#fGt!JfOr5BfNf<FfOwdb<Bd)MEVD9>vjG)|`x1a~-V%Ud
> z`4WK5>i~c$`4WIwllqTW1Bm((vs93Q0U>|-5`cjE5`b{t5`c*M5`cX95`cjD5`fr}
> z0Dzt90DzT~_K`mZi24$MA!?I5l5hbXldO`1F$HeD7YnovvOwwpW!V=TkpO^y`VxR}
> z-V%U_`VxTLj1hp*ItYLvY7u~d`VxSI`Vy01lR*QB`Vy0*lW`KoYY~7sZ4rPWY7u}q
> zkpO_nX_F_ELOO{05`fL?0Dy%05`dkX0Dyn`5`cX95`cjE5`g_<1!4hfYwHBEVA=$-
> zK<WTx1(yKt17n2x5`gt>lcSW128j9+fFWv=GnIl0i24$MIc*VuA!?Jqm6ib<lU9}^
> z63J;1fN<UtfIW8zfQb4MfZU9ei<US66O+W2X#oq9E|)th$!QUQ+>8-`(K-l#aNZJt
> zi24$Mg!&SI32YI7@tXjEfcg@EL7M=8A!?J8ms9~6ljxTv7RhN5fQb4MfZU7`fYCY#
> zfN<UtfFWv=BbZ(X$!QUQi24$fh?tcUk#7-zU2qYAIFSH=VQ~?F@o|$cnKA(hvtpSC
> z0RpJ|lWUrm9u{u>Z3nVI>IG~ImjLeuV*m#dfOt3(fHXJ~fZU9eADb=$sQZ&oo2mks
> z`;+^dG6JOgvoD+;0RpJ|lTV#W0;v0wo1MA>sQZ&wo~{C@`;!NsECb;89FsPmr$XF}
> z5rEM;2!Iu>1Aurq5`dH(5`cJ*5rD*w5rC|Y5rFLb5`dtO5r8n25r9~Z5rDXj5rCAE
> z5rB}D5rAxs5rE)~lOLeof8BTyfRF|ffc1b8fOG~Dfbnz@fUS5DfDv>NfZcTwfE|4i
> zfI)^4fHiXwfTa5pfT4B~fS~&lfI)N-fSmghfGv0tfSCIdfN6ITfV>70fH`v!fKUb!
> zfK7uDfY=5SfE{-cfTRWzfSq&^fWQV4fQ@z$fT#u%fB|+9fSd*r6M!Xk5rC)w5`b(t
> z5`aa&0D$cKlaHYy9;o{gfc;|yVg#~4ngp~!>KJVWmjLerV@w7TfMAug&!N@<4ygMQ
> zfY199fX4e0fbn~?v!kv7e=o9NnlG}z@lT=()B$Xa>I>Bj)(&h;B0%c^WqoHz%K>X`
> z>V0QW!zZw)t3a6l_aA9M>JDrQl|YywY(VNP?Fy1$m?CUKHKH{@>n!abunU(!nBemt
> zYi#cUZbNNA>H%yFmq3`{^B-$$?*VQ^Z9wV)Y(SVGZ!GTtZb5B8OzHt_K$sA30d7WZ
> zK<WW(K$r$^0d7ZaK<WW(K$rq=0d7ZaK<WW(36}_w2ao{o1!F+#0A+n=NXr6ivljpd
> z5`d@x5`Y8;5`YW`5|a$3e*p@UjHXF0AoU+^2GR<$1=0a(1k%|TWCjv|r~ndxsQVIt
> znEMida0U{9C4Uis@4l_x+>Db0r)B{SlWM0wCZO~kZU)i_vIWusY6Q~W7pMRdfT;Tt
> zfF*wsfSCIdfbYJo-rS6n&!>n13X@o<Q2_{(s;F-RAom-S9H}`5sQVIt+>Dc3sbU7G
> z`x1b`fwRM@$^ioa^%0Yht1%+%`x1Z*2NHk)2NHk;2NHmk91?)BgAsrwe-VIeI1+%|
> zjI-mb4gnUZ`x1bOeG!1D01|-Jg%N<oeG!0Nev=2SE&}-blQ*q43H<vKfVGwdfCZCw
> zt&1V}`x1cs`x1cg1QLM36a|1L5dgL*5dgL-5dgOMI}(5evm&n70Rr5Nll!ki8uf+|
> zfG`#kfF*|!fCvi`fN6&jfba?ufE9?7SFpYb+>8-`(K-l#F_Rv#F9P)YlTWcS0`&Wn
> zgR$BMrHc`OiHnnCvU(R$j1hncJQ9Er83%w6QWAjSixGf9006THvz-eFlamXx((<SY
> Llko{ZlkC0-tv+j`
>
> --
> 2.17.1
>
