Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB37C6FA99
	for <linux-firmware@archiver.kernel.org>; Fri, 10 Mar 2023 12:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 96668C433A4; Fri, 10 Mar 2023 12:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA37C4339E
	for <linux-firmware@kernel.org>; Fri, 10 Mar 2023 12:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678451974;
	bh=kMndxHroVZYcFfJlM56wsIpx/EUs5wRYMO7f8WqPHLw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=HrrLgtMo7qa98nkRhBvo0YJEliKvuBDCmUoZNU3aZuiP08Lxyny7AwYIly+MIjO07
	 E8BvuRsSldXgTLhW2zbIBio4z2zemZ+3DGXYc7SjO055u7Urbibg4pVe9sHKAhVSz0
	 7ZIYyDAEVet/EhrIJTm/uUeDwQ+2/XYa6SpcN+oeg7G4ZIassDxbNrQ97uk3ifS2+O
	 1OmK11DmNWN0XEq9wdPmy9gULf9zMu6NgPjL8WS03c/e+f3HcErhOPjg2yEqxN64MN
	 tUZeMQpDL75LscVd6LCkUquJHAr3pKEKzPhRKxkEn3SlcwTulwSkDaajdfiJU7+qQ+
	 Lo73ZuBGDN0SQ==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-536c2a1cc07so95030217b3.5
        for <linux-firmware@kernel.org>; Fri, 10 Mar 2023 04:39:34 -0800 (PST)
X-Gm-Message-State: AO0yUKW57PGwluvcrdQk12sxrcfBqnmVxUhA18AbgdPxP2c6PMcoMNEd
	ud9pKFA012YvVBNC9ckQ1wpnYYmaosszXpAloDc=
X-Google-Smtp-Source: AK7set+aQcxyTaA9wWp8YFeBWP9aCTRcebcfY1at7Gj+SwfGJsVic/HH4CbmtIMw0gWHqfJ/lP8Hl07NDE5sI0YEIE0=
X-Received: by 2002:a81:ac21:0:b0:534:2d49:7912 with SMTP id
 k33-20020a81ac21000000b005342d497912mr16538762ywh.6.1678451973416; Fri, 10
 Mar 2023 04:39:33 -0800 (PST)
MIME-Version: 1.0
References: <20230309122934.7798-1-hildawu@realtek.com>
In-Reply-To: <20230309122934.7798-1-hildawu@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 10 Mar 2023 07:39:22 -0500
X-Gmail-Original-Message-ID: <CA+5PVA52AMLxmfc1rdnfBu4cd0om-3GDhJPsNO-qk_Q6hpBkSQ@mail.gmail.com>
Message-ID: <CA+5PVA52AMLxmfc1rdnfBu4cd0om-3GDhJPsNO-qk_Q6hpBkSQ@mail.gmail.com>
Subject: Re: [PATCH] rtl_bt: Update RTL8822C BT USB firmware to 0x0CC6_D2E3
To: hildawu@realtek.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Larry.Finger@lwfinger.net, max.chou@realtek.com, 
	alex_lu@realsil.com.cn, mu_hua_chen@realtek.com, hsinyu_chang@realtek.com, 
	kidman@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied and pushed out.

josh

On Thu, Mar 9, 2023 at 7:29=E2=80=AFAM <hildawu@realtek.com> wrote:
>
> From: Hilda Wu <hildawu@realtek.com>
>
> This firmware patch update for Realtek RTL8822C BT USB controller.
>
> Release Version: 0x0CC6_D2E3
>
> Signed-off-by: Hilda Wu <hildawu@realtek.com>
> ---
>  rtl_bt/rtl8822cu_fw.bin | Bin 59332 -> 59864 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/rtl_bt/rtl8822cu_fw.bin b/rtl_bt/rtl8822cu_fw.bin
> index 05fcba3fa9813ac41d05909b57421c01b703b7ac..457e1cc387727223911305f02=
1065d4c651b66fc 100644
> GIT binary patch
> delta 6566
> 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
$
> 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
> Y3gK!72v+xW1XlNS1d|~>K$E=3DZ2m`6J5dZ)H
>
> delta 5878
> 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
jE5
> zpbT;hVac*Uq6sR=3Dv_PBzN&_OuvOwwpWdLeLz{9ctYhc0vZ2oP;vT_hbpkVP1Du<v(
> zpnx<@?Em*4YE10EvOwwv1z_<4D!pfHt)TK4N?7Z=3DlT(u`f3UL>>Ph2Z@NTN0TOjct
> zV4!PY@NUXG5gTeoz-PcW5vj63>XBz)YfS54a}i;n@)&AZ>7%m}>S^Kt@@Aq4Bf#)a
> zq5*OQVUcH_vOwwpZ2?LDYE0=3D0S>s`xvOuB$@fIopY@4zX5kjB?atmMzasyxiascrQ
> zVMCw*@dzrAe`f)01rS4^0PzAUkY@mGk+MMQ0A>6TB%r-#ac5vLW1vjU1_fo||Mwqj
> zZ0UruK<bfa1S;KUh_XQHjIID{hq7S8hq6HG0A)g;4=3DPKb4Jw7QK<WTxVrP+O2-AbI
> zK<WW)2$O=3DcK<a~MLZHC#4=3DRyof3nIDLZHC#2`Xfue?y>PGeP73_aACZ=3DytL|>HuXT
> zXOL%gvOwwqZINemvb7M9XLPc%5MrPJY7-DhGyzQiZLI8>;De^(rf;^@u7EV{?9S{2
> zEN!wt>HuY+5CKZ8>SOBbVVe*mphBP^F-_@avQ?@s>H{ievOwwpWn!{&svT#MX8}uc
> z$^dFi4aiTjK<Wksfbat<Y^akkl^6k6lS!2&0Z)@}m0J}#vM~@LvOuCVDlZT>vOwwp
> zWd$NOli!sce=3Do8?>IBfBp%k)!ngI0xYFO<ovOww*?I^MU!T`Z4vVocolAxL?vOwwp
> zWeyMylN7Rmt3c`iWhJse>JF3z5C*b<nn6U#D%BSamkf~$kO1!oV;r~=3DfEc(EfIXW4
> zfVr;_fQ9`9fKc2LfYm$!fH7SIfNZ)FfYt60fLR9-I)KTl5P)gA5`evb2Y^VC0D$!d
> z5rAZo0D#fu5P)R{5rAyB5`eYw5P+Bs5`ZYU5`bj{5rEZJ2Y?-uxt2c$Zn_eHH4Bse
> zmL3AF*Rvj%dIC8NxDtT$SrUMa8V7*LRT6*!oB)6hxDtR6xDtS^Ljr)+?ht?wx)Oi@
> z03ZM~x)Oj*?ht?|Iud|slhK(M0wK(k>Y27e0oV|L-PaI+#mEqVanTTf_0SN2dD9Sp
> z>Bta(dBzZcY#9=3DOjr|aSh073tC?yhr0mu-51Q!y3d9wq6)v*JB>86w7n$BVI+z^0>
> z1QLJ&{t$q$77~Ez_Yi=3DT3=3D)71>=3D1yQ3=3D)88^bmk74HAG2=3D@5W04HAHG01|)z00=
4k+
> zx)Oi^?+}2j77~ED=3DMaD_5E6hix)Okq3=3D)88x)OkDx)Oj8x)OkNlM$Ss1?Bn>fHae}
> zoJR%a`VfFLlL4J00W^~(ol^!hx)OlsBa?oez5x)EJ)SES5V{h81ha*UL}vjkNTdI2
> zAn0uB5R-kL=3DM50L5`eiP5rFhr5`cJ<ai5<JG`bRi0<s|JS*ieKG?N{m9|1J8J)k=3DQ
> z0T7dUp^F6&x)OkRlL?|BA1Jaw>I4NfDgki=3DU;=3DR$U@Q<_XK1Py!l3dPYFO(blS!f-
> zE)@`6XK1Py!l3dPYFO(Qvz=3D!W>Ph1O@noWS!~pSSqItvs@n)iW!~pR}qFcn1fTA7&
> z2$P?p9h1PKm<4#c5`Z+5U883KG?T@n{{aw_#iX$T8IyOV9|0Vbm!%~F)FYF=3DrS=3Dju
> zx)OjK0RXm)1QLKC0RXntBa_CadJbs15`bCa5P-a(0I;#<lTN3y8Z^2RfU)KffNZxC
> zfE)n;wu}T4fFJ<?w$vk&8mKM;)FYEhsOkdLBa=3D3%N)iyd5`aDF5P*2P5`c8N5`c-~
> zlai^P3N*SBfN%g3fYc+CI;t`T<RcM)f$EcTs&WoAx)OkZ1`>dT1`>eOBa`x~CI&RR
> z5`barvmUD=3D0unU35`Zo15P;Mp5r8d52Y_%YlTxjQ2J|BlfYc+C-mNMMY`PMF000O8
> zP41Htu6_d4Ba@P@Mgr6$liIFY0@NduHm^<rZj*(t-wORA5rBnr0f5valWwq13VrYp
> zfNZxCfLY>`#;{5bXu1-BVet@vyr2NEvF4K=3Dv1Sbrx)Ol&SrUL`kpO^jlaaCW0eF*z
> zvfBv|x)OkFx)OkRlWDW}Ce$MlfGtJ`fW3bQfaU8DfIa9CfQk$ffQ$?hfF1JyfHb-i
> zfE5yxhP0jn)FYE7wT>=3Dsx)OkGDFJ|t1QLJ{x)Oka^$>t~x)OlBe+Pi&;}C!V0096^
> z?ht@I=3D@5V^>XYKN?g4I-(Y6;3{TUH}umuu;G`bRi)FZR@w(bF5QQ#1O000C4P3{nY
> z^jQ*sG`bRi6%rAENCpysPzDl!`4JI-)FTmqZn_eH(e@C4&F>I^Z7BhOZ3_{Ayr2NE
> zJ?IdCY_}4Ch5ZG9P}~xLi5~!fEk*}`iQ*7|?c$R{xt<m@x)OlR?+}30BN2ctMhAe=3D
> z_7H$=3D3$ymQ8UZRax)OlsBN2dXw-SJj;Shijx)Ojf`VfF_x)OkGDFJ}F<Pd;e-VlII
> z?vpyZS`ySF5r8d52Y@uX5`fL`5P;G4lcu}c9yGcVfYc)qfGtJ`fH|N8fH@EmfNr`H
> zfNd!OfGPZwp1e{bDew@0l&%thZn_eHZ7BhOy?+OQ8Ug^ej06&ZZ~zj3mHd+uy`nB0
> zx)Oky=3Dm3Cl01|)z002NZ3le}mn*f02`VfGTn*e}pw-SKingD><FA{*%Ba`C2?gQQa
> z5R=3DosxdZ+G5VMcJNdXmjx)OjKx)OkFw-SJv=3Dm3Bax)OkBlkLEn0TGjj!95b){t$p{
> zw-SKKfCqp8oDhK2BeT}Qo&f^6&y#k;sshOZlOn`y0UeW%#5Vy2lgGr34%8zNfGtJ`
> zfC!urfXM=3DrV#S^U$pVuC#%2P^0+VXSmJam>5rEzP5P$%j5P-=3D7lMcsR0S=3DRE$1xV&
> z{t$rFBN2cAoDhI5MhAdww-SKK0+X`GNC60w`^QlOK=3DS~TPsmLw-Tn}O)FTmqEk*}`
> zY_}4C0Gtqj0G$wk6$KH1k(&U31f39o;hF$|$pVwc$d(V?0TF<q2oZn*2oZoe{}7XF
> z$#n`{3K4+F3=3D)9-50mQ2G68^-9m?+kZj%kmCjo$yHOs>RfRp*l!wJ+Q5rAM;5`ch{
> z#mwUYfU~L14*>yylex|x0@Ndu+Rh>pT?!F^$P5yI{SOg<5DgN56(5rh&t3trvu)2G
> z16G|C5r7;K5`ZZb5rDV_5`d);5r7a85`cLU5r9Aj5`dK%5r9Yr5`ak&5r9wz5`gIy
> z5r8xX5`gg%5r8lT5`fhc5r7m15`fqR5`c*w5rEAZ5r8cjlj71+0@Ne3Hq$ZzLDVA=3D
> zfN%g3fXFlwfGtJ`fMJXSfaEh0fV3$QfLJOKfSe`~fcz*CfGjByfXJi=3DfD9xNfbb;|
> zfNUlafLx&mfUvWv)N=3Dy?tdkwsg9fa+5`YyJv!>YI1O~9W5`ferlZxGz60o`wfc+T}
> zfC94vvLNVS+9e;eGTzn%7J>2*fDQ5xfJxsFfTi;gfMMSdfL-6S9^+~T2nYw{{|E=3D<
> M|C1p-K$Fnv2&S}vcK`qY
>
> --
> 2.17.1
>
