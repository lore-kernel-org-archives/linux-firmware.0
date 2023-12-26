Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03C1C46CD3
	for <linux-firmware@archiver.kernel.org>; Tue, 26 Dec 2023 19:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C7251C433CA; Tue, 26 Dec 2023 19:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9767C433C8
	for <linux-firmware@kernel.org>; Tue, 26 Dec 2023 19:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703619847;
	bh=Urw9qr9CFQfmTx1SmzAHlh3cMqpe1jKIaJIGxJVtsTU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ejSECB3YfiK72AWkuKvayCGtKr1DwjH+10rLxXIz3tgPBmA4/Vsi5E4Q/9HrT6BH4
	 fLATIcxnr8F2vOaayK/mMt6hq5apJoQsiBXJ0g1Uc3FGU9/Iit1b7AhuYHMdQpJstD
	 pR3jW8nef2b6ofYg34tj0HJt8daT+s6bCFTplBhqevhULA4gUI6++Ym2xzeZBW/gvP
	 cROUCnwru/IqPvCnHri7gIdtoXuaKp9VqVKmvVQsp8URU0wkxLWHnLZVHEpIS6i30r
	 iRv2qTkBoMLXbXDTLewt6udxeqDugLxia7WR8eZLY5q/18Rv7sHubv3Ypy+7FHhcPe
	 RId+aY0xTBfMg==
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dbd99c08cd6so3002117276.0
        for <linux-firmware@kernel.org>; Tue, 26 Dec 2023 11:44:07 -0800 (PST)
X-Gm-Message-State: AOJu0Yx3KpybL+0MPMefg/DgY1XBfY2KQaM+I/iEjPMMif2D7NBWrt/n
	6UHm0oopEKK/gD1nFc3rSShVTPVrlyUfUPc4uEY=
X-Google-Smtp-Source: AGHT+IHgkAB9Z8EITCKFWDB4+HdL9aJ8UFSLsBnPzZemFUhTy3BwQPxsq7vM6ywUgbRAm33Z8dZbGKwGL4xn62/4Uv8=
X-Received: by 2002:a25:d88f:0:b0:dbd:c3cd:1afa with SMTP id
 p137-20020a25d88f000000b00dbdc3cd1afamr3538275ybg.36.1703619846690; Tue, 26
 Dec 2023 11:44:06 -0800 (PST)
MIME-Version: 1.0
References: <20231226015856.13756-1-max.chou@realtek.com>
In-Reply-To: <20231226015856.13756-1-max.chou@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 26 Dec 2023 14:43:55 -0500
X-Gmail-Original-Message-ID: <CA+5PVA51=eG+wCBRntCb+spRMRMHVBTjMJe=16J8GNZ7b=Epig@mail.gmail.com>
Message-ID: <CA+5PVA51=eG+wCBRntCb+spRMRMHVBTjMJe=16J8GNZ7b=Epig@mail.gmail.com>
Subject: Re: [PATCH] rtl_bt: Add firmware and config files for RTL8852BT/RTL8852BE-VT
To: max.chou@realtek.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, alex_lu@realsil.com.cn, hildawu@realtek.com, 
	karenhsu@realtek.com, mu_hua_chen@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/106

josh

On Mon, Dec 25, 2023 at 8:59=E2=80=AFPM <max.chou@realtek.com> wrote:
>
> From: Max Chou <max.chou@realtek.com>
>
> This firmware/config is submitted for RTL8852BT/RTL8852BE-VT BT USB I/F.
>
> Version: 0x04BE_960C
>
> Signed-off-by: Max Chou <max.chou@realtek.com>
> ---
>  WHENCE                       |   2 ++
>  rtl_bt/rtl8852btu_config.bin | Bin 0 -> 6 bytes
>  rtl_bt/rtl8852btu_fw.bin     | Bin 0 -> 39593 bytes
>  3 files changed, 2 insertions(+)
>  create mode 100644 rtl_bt/rtl8852btu_config.bin
>  create mode 100644 rtl_bt/rtl8852btu_fw.bin
>
> diff --git a/WHENCE b/WHENCE
> index d9f64cec..f63ae383 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -3992,6 +3992,8 @@ File: rtl_bt/rtl8852cu_fw_v2.bin
>  File: rtl_bt/rtl8852cu_config.bin
>  File: rtl_bt/rtl8851bu_fw.bin
>  File: rtl_bt/rtl8851bu_config.bin
> +File: rtl_bt/rtl8852btu_fw.bin
> +File: rtl_bt/rtl8852btu_config.bin
>
>  Licence: Redistributable. See LICENCE.rtlwifi_firmware.txt for details.
>
> diff --git a/rtl_bt/rtl8852btu_config.bin b/rtl_bt/rtl8852btu_config.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..91d3f4402289e7b0efd395c7f=
cc8b4789465aba6
> GIT binary patch
> literal 6
> NcmWGtt=3D!JQ000Mk0jmH2
>
> literal 0
> HcmV?d00001
>
> diff --git a/rtl_bt/rtl8852btu_fw.bin b/rtl_bt/rtl8852btu_fw.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..a78b43239a0d63db85d272faf=
5c8ed4189ae60a7
> GIT binary patch
> literal 39593
> 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
=3D
> zUlm^q7KXUA{NO`@vjP5`N=3DFsjSd8)vz>Dgh{aU>2fE|`##2?Z?f=3DToxX7V*=3Dyy<LY
> zot$+8I%puCEP<fJ>X&b99KKA(m+R=3D`yT_RmOJE<4*}fQ89%vL(GRMnY#?>-M8K-*Z
> zmG_rKyYrFOf5E(JO10WYTWO6%rTf8oaou><qk~q#r9vZ9IO4r0?rZE44gOa^<C#*x
> z%x!=3D)_9}i|71iJRN<KSYDhd+sDh%G~eKYj;{z-1(%nYv)8s{CL!&?J<YZh8*kaQK~
> zd06g|0!f+Eyw<N?@F>23Al_O!`__9}3bzLF1dZjm)DvU{u_=3DA#_mOUF#rqCuX^g}=3D
> z<<^40L?7RZ>raV$<$AKtMf-<Ax+P1YzBop^$u=3D@<mQ8*Rw)!6z!G4V2BzutzLwxZx
> zcm?sO_wnpDGpF*+8FI!t*vYqY^6G!hkk10XqfzF^qfiIv>qxwhz_mPuIYslvwet<e
> z9qf%b=3D&hQFraWF?oH2<2>lirJZy}50W_~z4Im<mP=3D5~0dH8Q_Sk2gG<t&s<-3@-Bj
> z;0?bDs^SXhy`VY2^n_w1OTu_BVy-u!5659opnlUBj9#X1ktZ>e)`bBOBY3H}rdKS-
> zTro*OjAI|{l{5|-L%i4Q;sO5zWo06_f=3DPooMw~B(Q*&$M(Z`7cYnaADHZ{hP)C6hj
> z5a!V54)A~B4>2xg87$KS)@rr@l6}zeWWT^4`ifSv^B8;;TVOlSMIRW3`FXoJs^C2E
> z7`4U9F%HTX!{anDH+x#wf}DGr)_ewQx%=3D)D4T0s^Yq}PGW{vFfkOtf+7G~%AimqO*
> zA=3D;Yl-PhY(r`kwP)F)1{Uboj6r_b;i{Q8T0Q1^+ULcd$LmvTmb@_?|fHzjEA1UIQ-
> z*WF`J2RBLg>HWk{-mKAmqIqhD9p$U0PoE5X-sYOAX=3DU~A2Gdf>mNLP|2OC9t8}H*w
> z>0Mu;+Y70wZgubI6Wc&x_<eCUvas$Dv5x%1Pco9}l!6Im@;<_Z4EIo5GU@t6Ur7Ha
> zyE5S=3D>HaZ#PPC6``aC}?$LuY`fQKLAQt%Ho%C&<qTnPUVrR%)W{sic|d|hFf;5>PN
> z!dgL3iI!3x6Y@-Qk96^MuHXo%Ay63H7L4996>bGR*cx;P3d1Df#!AA+GNi1|YmMZ4
> zbT-Nnld9sp-&m->+u-AB#6@lJ4a^N~`P~9@LkDXQbAv61tzZCCm>XltbA`z_CY9f^
> zLoNojxNaE(zOfj5V}7l6#b~?5r*&7gje=3D|@)HejR1+X%@Qo=3D8W+3BBmN8KsGhM=3DqK
> z+0($rRuwbV`+r%;e*!+K)Twf_4`J=3D?!x|!bKzwC0*7~csXgwc>+!;oHhk+K8KV^4{
> zQN_b{SesFgMkL*aag6Zg)l9oSrmQ8xmKyyjfWSu2x9<20z!8rD_qiUue{PKq{tT^O
> zi@65{hcrxg*lR`1I^<M6<kVxJL)6}m?W)}@rrSJs{{a5~5AAkE^#8xw-M{>QZkKWD
> zeO2|$b;boa!|FFT)GyH5C7;@5hB>9I%XY?T^vC-X{E)tHjB-BGMsh7HjX7b?ggtlT
> zmK!6=3DJhwEkc31}Vy>HzFIgK>(L_$UU9wU4`!{KM4Rd7Ny+fo$&9YG7WRKKo$%Z-sJ
> zp9sC4_@+jRLF|L^fD8Pkr2EBSbp>g^$y06gq$4JJJBjNY*d(sXZV2UNLnAG02o!uq
> zn(2W6oAr5j^Q~1maiC1*koz-h_v&oML3(9>@vv3q^U3W~!Kd!YG<9HH@J<>1yV^K^
> zD*9^Nn|hKYex@|FG4)j1iRqc9O4x;3ZO~!O(`~Q=3DM_p`zJA7HPzL)6ddrg<3uEYw{
> zo(WBCfpAvvum$`zp+$!gYR_~2EjNahwcHwp5o+P#VI0Huns+7xE8>g!Ym8$sR|;~C
> zL@tdK0?yL-Xsk45@<|X3e)~ndV&DFuJ{<E^klf$dH=3D<nV8!PZPQp(MC>mj~+7=3DCMo
> zlodQA_ZP&fNJ=3DV)RmqljMl{0jFiPkJW^FmsmmnmS_uKQUi>vu;(D-asCTDJF${kp*
> zhVmZ!yy`DAAFO^A--|+xC~46C_iaA`s0ut$$6*mGx++8#*XL(%4PYKtJZ;Au!9KIN
> z?PJS`a%-Pn7`bAikW&5_bckmA#%jj3dG<r|?sNRo+grCO_?~d=3DN}h-9hm?_hHt?zV
> z>6Mlv=3DK|MYy<;->(Tq5bShC8?g?}mc*z@3Xcu?S0+>5dNNYIq;x9@1&i98$jN5R43
> zR_qk2_HEd|O(`|#GniNXhR;-Pvhy{@%-0qBJ7;?hd5j%K_!s7V0Bb<&ckazpN?L2F
> zTHz6@oK+TB_dGB68!~02v(jpdv0Ni0mjB)|x0-c7(?34*XGq^EF30a@`bTCm?taTp
> zAd&rqYH{QtEg`c2cSGjt>P^+_ya}+-8ZRVN8h6=3D50d{4AofImiy5TW%E2Xk6dDRc}
> zCueT1POW~{E9a(vM!ERF)*hpOr&z4yHCApCyDg7-1&`4`seerBBf#AR|I>~3d{gR5
> zr54UsRlStnq@t$9N($rRI+(J;QwvW%rlcDyc+Y~_kA9v|As<+Vl&aar3dSXTAhi70
> z3-}#)#zN(GibaZS&z4WJ7b^7>kXKT|43`V_TZ3@|*$9WF>HPDtvNc%Q`i?C(hL<t7
> z#sH)9P(mxwo%FJT0Qu(f0SO-72&$zpG!fqn+TY!>0H1c$-80|?R=3Du!yDdp-$sWL`*
> z)JX3`b*rjN1HZe)WZoQ=3DSN+Rd<1=3D@PcX(G@1o&sNnn(^G)F}(0Q)V;?4fLD}?=3DH!T
> zn@5q~Q6s<dhH8r^{`J8FHrW9G9}6CPxK5S%NCqVN?;PS1GVxBjRe0GTzaU+F@>0Zf
> z;7Rh~H-C$lV|+Rc*^_wAh6%96fR@H+*st-M^b67fUU>v<q8#aMBm=3D~34t(uWUm?6S
> zsh;R_j|-4roXdNPd@0@RRaJT^vKRO~H3h!o1G?}$yY@oN2Q(kD3gd|V%EvFh6#nh1
> zJa4q@Le9mjM`t&7aUDV}%~vS2FSqfton6+*_1Xzjt&ttIGeT)u+KO2|?h@}Q%${>~
> z?$O!4HC?I>Ck67dmu1J>peHL@0=3DLH_&cxijD&DDj&3m>1wu2rVb{#8?7Poefo_VtK
> zB-*Gr985zShi8Po%-ZpmHR3xA+V^~_eey{@ti7b&qpRR5&tH8#cV}01t>$@+z!p`X
> z<|^5;bMU+Tv`aqX?p)Kwu76()h2zSCy|uGLq2nROCI8+UDR22t%MsE19^b3Iq^r>G
> z`7`Ke%wHdqsbcaJ$zG60Pm%BU+!RKEf8(9;@<Pa4G1+RUe7e+TyKPqyYG-+8oun9p
> zVl~Dfh&h4QSy086FSKXD){%AF)-eZG^EX4$HH=3DG{zaT6c$a%)Y{_8NvnIGVp2+Kwr
> zp7HkoI&fvaZtA9MoDf~35v872MYh2B<W)QPD<I8X;C6XLk}jFj`MJ_l!u4S;i~WUA
> zO8AAFhN2WN3k{8xIwR#(X3(6@h**`3XR_DYGHB6Rl>I^=3DCEW8*;6iYSpTWsPV=3DO4P
> z;-A5yC)EZUb&7LzDt(<>Yk~}xU?Xcmv|KN!GEYp-12;cl1|Oz1e{(>$r?{pEaj|m|
> zrv!VrYDeb5wI<ydSDr2W?&g^ChlELx5aR{#+YdpDf6q8$wqgEo6xIm-NVI$;^sPxg
> zonPC*`KR4TE@Q82L1oC#sgW3`eAFW<wzpE&dBuWQB@g4gIbDIDqt7x}ixIUX4XI`F
> zb++^`7K{m;VN>m9(58)5`PuBE?Ey_DaevrAynnUmy??gE*7C=3D%#L3q&p7V$$TL?aV
> z6R}HXNQe)5k~8^+WS?A<>??t-DnS^Q)!RP``ktyW>&(6VW1YPg9a2YvSMlda>I&jr
> zm8GWw{v;=3DIzPWG4*`h9MH*~}9{F?PhPXv~6PqOwn7vLT_<>4dyJivg+<DRqO+SzAA
> zFXX(QdpvkHP?)`qT7xVn1!6L%!Mg^rJBTHc7J3S?_J598zXuS>q_)5~V)<fr#B|aX
> zN?12vX9_%)lj`m4Yxgt+rR>SRhHHFef6ci7AGui55Zaa7aP6bJwgt`w#y5>WWv!Ku
> zH1xa~YKGUeA$0V}J+tlz?8w!uEDF6Zvd+a}z^CTrHNTm?wdZ)xFdJF8xQ=3D07=3DK5Hv
> zs*ZJ<!bRaEq?y7T_%ZUfMx9xKK}<dZeS~y$qS-`~sm~<4k3}2`=3D{PYOI=3D7Y++46Mz
> zhC?qqdDm;R3&RgM3&SbE%8j}1FzcdKBZX`tr1z?H#3*dMIUX`>!T|UB&W$*c04FUK
> z2kDt=3DOa20Ds1UZ77!KHnBL>Fn^yH+*TAqABZF|ZO+J-)ewgJ&HYCo%2?ScM0wXZE}
> zxyhk@l8cFZe&;3&nMN9H9a=3Dk9Qn#{_?#axM7YymcOCtyEWbr5XeQB_wYb3pm-$#@o
> zPSMwP4zb`-T-)>TMaSkj7j?5GxhMI^+QaO0rX(A_fyx@8?_$llkR~lo+Sa}LpeB`b
> zxx1nL97eRu;pm$9vTZ?YWYghbZ>W1)Fe~T^HutZ}$qGuj+q&7(9pc&0wx9+S@N95v
> z_eOD&*WC?xUYzKi3vA_f7X+I7^C00Z$r%QDz=3DViXYoz$_WaL-tIU8J`vsFo5efVW5
> zey^G;U7IstGg)=3D`Pj{U|{4BNkb0ue1K)=3DJVQ;Eb-e8q$x#D9r56OJhKY(U2vd9wKU
> zM$wE_l<eXo9fy;lAq?}f?)(F1!%ee~2Q}q!B4>}AA(td{ySuT@0Qm%19<>AgSeu;~
> z;C7IdsrpJt4j9^A#sK|PF$VVox+bavv{CV`6fI*F`UgJ5(;S$+Rks*-Ri93wmPxSi
> z6nIiH6KVCiYQHj-AtE6%sq{NoP<4L8faXN_pao=3DT#Dw=3D`@A-C!oDsvu45jxOji9BU
> z&iOR&)2Mq&(-iO26NtYlz57p7P9i4wFl<z~UR0vMgdD^mBM!_Rg3V2d28J)zHnEZ4
> zA7>+<=3D}yJM!IX_VHRdGQyIHAfA5mL*|5&BpNtyiq&u?kVtT!hCpGOV!_B%IOLo||N
> z6LAb;HRJg82%}7NZ3pJ-WD2Xmk!)QAn{K3${Ph73JsnT7f6zE%Yi}XS8oX7Ajcf=3DS
> zQdiYkVPoGOjGMl?jxAVy1~e6ZyqN=3DYu~KY5V~s4XrI<`>q_8$xK3bKm!ikE`0{&TJ
> zjV!4x4VWN<S|hw?eZw;7KuZvT5|??~;sH-_Trt^hUYTx_;q^SgmP*%FiIb+Zp!HDg
> zwQFN%u+Jyk=3Dhd-`=3DCxTP51~D+{h>pf56-FE(v=3DTCleK$(D`cVCXFZ#OobYVjt1WE7
> zvqSnCvv;%4t1)!OORpR{f+#vfPJIHn{nHpa7O}F&77y5lD8ki~a6)eb&uZqYVs=3DU3
> z3uFn6#I9J5NY~N;*+rHhrq}>j6FpGZN2)i~mv-W3mk}FSh1ft`&nmI&LQW?vmV^}(
> zhQx?>MjVJ%N1o;}KIB$n#gVU>KWG5whcx(Sb-srym`r?xsJs*?3X`u(3ODyXgs5~W
> zz}aB0LGKJhVo52Ecw2_*#{@3OzkwZbD4i$yf%>dU9SLN2K9hk+4DH?}u2pA>5wW`Z
> zjN{C+XT&pF@AGHWb+;S%5&}-qTBWj}@dpex;eeFwLR6F<kv)1}@nx0L#?~s~U<3L>
> zIJn^s)xHIurAWYL-!Mc0R@8R({k$gX&I8A72(nThG+&p({k8`h0(x6~Q@od*PHhdP
> z0ZY(-;$uXkXqyR*=3DMh{a3Fy5B#912<ac%Ie!c~lGH7;wn<MK?**$05j@o6^MKE)<~
> zitBk?jksdClkS~@@>2%xQ}I64tK5AVh}>2vLdjHb2GTPI?#!7C_zg0A)9`&-<1}xk
> zkMF_T?I+VhdRqqeHsFekYSl|qeU)vjw5x53Z)%hL=3Dcxnt47_Lf)H~lg=3Dwo3Vucv3o
> zZ)Mu#3k>Y+QxP+dXFSGHi18d=3D2><y!#MtBg3B=3DfchUf0PY_bG+Oh6f;rz8`N#27cD
> z9-4=3Dr<2euCM!-Jw&A+HRSr+op+%CW~3w7N5H<ZOQ@nxI5)__=3DUtdp-14}T16m*h}_
> z*Q#3B?)|CLVV|mdNnF$h38C(>))X&rQ?c7G$xeoZ^pf~^>rCg8);YCig#*1LE^P&l
> zI~TSYFt6G@+-_xUIbnl`SDN-5#P%Qj3F9PO(?PD>9?;sfC*@Y6CQ9T6XbH(M*hZlE
> z>9nw2#--_>inHq=3D^Q{L}*mZ`+5~Jm#8y`NlJurnV&G3}7rSsq?Vx;Ci#x?qGsrTg@
> zlM1l5dI>v;b4ZXd)EtQeR9M$ua%)W4hMOkv5>6rsXZXiMX)(1$vdvK0LgTe|KT^jy
> z=3Do`tz`PsUrrJqHe51u8ASa6mo+OpH?cN!<jEsVoRTByWhHSmxE_+XsGx^!MwP>DWQ
> zc;Ig_hkeke^M{O&DM=3DF@B9|SHR)(E=3D;)~bc<+NsRBCI94OVRSg%4A`sxS&qAXGXx7
> zx$ITGm2s-QS2?k+m|YM>%q_S4e<6yi02Ge;OgerHextl|>qa#$_;{3eb)D<uvbrU8
> zr5`W-7?fhBy_1{CUU~f};I@9bn3%b&86*5iwK#B3_6~_l<g}P^#2ZG-b(OtJe}Wd0
> zFQ_fTJ!&szU%bO>)bfFp3sGn_E5-E#KE!E?CND&uI+~yP$9;@@ij>~S_n0o3_M8p;
> zDDx#TU9v{x*2ztL-<I0RC*#T>bG23>R=3DX;4`mjMO=3Dbj5e?rPnb3k!7X*e1C_Uy4X+
> z<@c+tTK{TDk7R${RSz#>&lJhMFTGz=3DR()%DsXI{gr<98C+<JeyQ|Bj~AW4&?8%`Ru
> zNycm<V>TER+C;pV@cEU^hTD9XWETEV$*q*KEB#t<dEIR;PnZqNQf&R&;uxP+=3Du&&U
> zR|~n6(=3Du)?IPB57q%gbkeUeId%oEjE4r*J`mcy}F%B3DnIqc7N=3D!n;~%F5I9X|Nu7
> zV4uq0i5C;z!QVmjb--)NIG#eEV}2!gtFCKYsVAg>GmvDDI`co83@t4WF|ZoEv(CW?
> z^6_3~jqOjccYHMoew4!SghGmvHTXyS3>7bvt+_rbO)ezfHNuzGtUJ%H(RREJX=3Dfw6
> z1K+{E%bh20grOt<sG*WOPa3MWe>}b#@Rin^7W(N&3SJVfke{1mH}bK>U}Z$l@;!;R
> zc(2jd+4qzO{H10~7YiuF+4Bz)_g2SE<zxJVQV0gZA+u8t{;Gk*zpL)H%%ZF}!p}8W
> zZ<B6Qw%N8Ad?3di;37;3dVawslGR}cX3EsFxM%caLnVLE6c}RzCkK47OU5}IIx~ln
> zrT52|Y5I~eG8!|72rpXsgRlf<DJ2rTiboK#7~vA}J(4$w-^Io}4fL6Kp94=3D7w^-Nf
> zx41I0H%S3R^|TJky?K43&>~6J3Z7BqwS#y=3DtS<hL{v_+l%U*$!_QT|9h9x=3D({i1u$
> zhc6&rB1Q{{hQfM@F`F=3DEteD$l9y!^hjCmBr%MFY<`SzIO%4~gO(F2k@xFPx(@d1L*
> zEt0GL$rx#TioVs(AA((^#1t4mP(R=3DTnUgFL1l8Y1MxX`F?G`{!Z`)B~mJre?s3mGA
> zHtv}G5SvrJ_6gf8pH_r7uts**hqnff2Vnbb<@Xu<S?Ifgqx%kV`jC63@~+;eDevlC
> z*ca!N0<$uwK(gd)xMQS<eDlpgwAJ>&_{=3D%2smRSZY$sB^)&rz<B95YGqo}^=3D{OWE1
> zjIMu7*$4ePj7`-X#{L7BP^~m74pCI5zWBETKJ0C|Hn|%9<dd@z>xSzje$Rr8up94b
> z(1*LhXLIo+o=3D^V$k8s6cLwts0$6jzn#!3F*eSxV;R8D84t`@s>>~iGwt*b(;uv$dy
> zyMzd`6(PIzWM`ir5&4Mk2(V?LkTLDGyq61MpZt8op{gI`Pe6XNb48HN{JeX(cYfXQ
> zrj#K3AlU6$oRhb;I48Q!BkF{xTMAdru9{tg{{^2n_s`8K4Y;~=3D%WA+yHFnSUXd10;
> z!yAZG0B$RIgMADZMCMNS5axnU0dwIc%I5rxOE+!kP6XJ%11YxkxnxDrcJSE?vbo)P
> zxhbWDu?KSF0@}(rfyx(l6MvgBt1$TAz*%aKY=3DO_6)5#0(9E{x`;Y}y1Ee>yLzTR{w
> zE9cIu>vP<nGtzIxs>lm9Z=3DBonA%Dvty?%~`_jq;AR_MzQf0&p3$cHH(LQ^HV2)HuT
> zj<E)N@u)45i&VZqIL3(?zST90sxnTw1B;rc`ZgboLsW;Ns~`q9uUY7O6!wU9HLw6L
> zV_nO|(!gA38$5X6+#}4bO}UJVwP{?|NbM2M$=3D*SBqpl+cW!KWk_X6)k?heBm;l>K!
> zn_1_=3D=3D3l(4Se>-daufJ+$pBwYRATY0*XLlbfCh1Q3!8~I5obC#%qTZ)P;E{muM@wI
> z@yTd0d!A{Zd+5H#>e~Aph#jw9Rm(^G)r-S?WNCF2F-nVre60!gkw3!DQ6DCY1uP!0
> zTzF=3Da4TO(;Q@uLJ6gI(P=3DZ5WTQSBth*W&8hYsk%(76i^BXI{1`ur}vx;CS$8?IVbi
> zn^$`_%$8Nnz80vR&8|2eJW{({GzG4O&%z$pU%fn=3DU0D=3D-u=3Dag%lEW1KT09%R7WmC<
> z6H0GE&)%<AZ7(LoD!m&rg~-?UX6UEl>Kd}wnL=3Dkna;|jk_1xyW+V3g~u{)U^=3DR&|1
> z%m%!|ptZzz6n@)Iau6p9ReIPV%Ujk|@sSs>w~zzGD1Ov|^+tIKcS#!4`bT&@u*B8`
> zH1OG(?eHew(mEHkG0tVJzSg86xT4xLHs@{5jYqT}IBx%>b=3D|^S;?mF7pT_EhzW7(*
> zE6oAn5VaAb>5Ma7#I6ay*00xQpm#gP{7iQ32tl(pQ_wp}W`9YX2Pr-Up4@+in=3D8fA
> zx||l(UO(3RmPirgLgeRl>rXR%hY&};yOrsC%fs|N?b*}%c<Uw0(ELdX_Aq_FM7~|E
> z);`&@8}|(!YhNC6cUv?{`vi#`NNN9JA^f5K$K)5CSMS^CAss=3Dr*Fj5AtVJ}=3DDWC!A
> zKN{5U#x_Dms7|#Jr#6$#s6_5FD?9uc_b6|kXKpv*3o(Aiq25QFr03KD>kH}Rzc@Ci
> zn+@~+#gfnGXD_@W*AWj_rD*b@5NwIBkc>k8AR2lMaaE+R(q5K@_uJ$#*(&dzV>aHN
> z>z72WU!7euW;a2Jr}?e;regDZ_(M(FL-mh*2$}IVbx>zqZI56Q!<oT)tONCItQlI*
> zlK+=3D_2v6e_IH<5Bo6Qf?$aWH=3DuR?A5^bzmzzhuFk$J*wJX`-ogqd4p&BH6K<gzMm|
> zf!~!&vbjY)UBYGi<yDu9FZ0-c!3FqVCU+NhGykpHspmqTg<RtL8ZadL(>=3DH-7CZi=3D
> z@K)5xuG8B|Vk-&?f8D59{#j?MSa_{}iWPeXDL>IglebnhDOSTIL<Rn$PLVf2vGkx=3D
> zuh)?*iFja0Myke%{WL#Tbt#%N!mU}*iIsJM_zhrw+p@NYvDVbpq4N`O;JBAW>y0ta
> z#cd1fC$?&&XIdB5>vzNQ)w-zO8ky6oQ~11L4|FW7Y1)VT1nQ*uDQSqV%MwOIQmyr5
> zPz0v?{oqL7Lv<<P<5y|7T4`WHrn5H1OP(^47+?>_svVw*Rz1cQ$;uvR(mOPW{pSxL
> z{zS2RVvZE+8erp8ae>wb`SIofCe>)0<VG`m+-C2u>KIo-7ULW_o#qqPBiJFedr4x5
> zD{gMUo;4?^8|-$f2FKiZ{g7%oXB@OwjbKFe4U|=3D+8Iv!?2G0+61|%sFukcit>+FE@
> z(Eg!zzV&aG`_T{T)AJ9geTv0jq+y=3DY(3b?vQ|gI(M7}C>GI_N3)J;Yz;*c<3QP|!l
> zHCcV;Ozj1d_+G!IhwXnnWFpd&5p8#SzbD!65J57KOIOx)lXMIg(IH`5QWIIw4BFe8
> z{rT5#Q4Z4VwGvTgYx89#E{kv>AGQv{2hz1;G7;fROiyLjm^2A~!}<90#`C80KSJrm
> z^BQp_te|Nv3A<R=3D5>X0(3cDKuX{RUKa=3Dq0DwCTUa*VP}csw+No_W=3DeLw*}Q}suu^%
> zh+bZOdf^8;|MUT!aN3QOGV3jp`G_KO(0>+u00|P3C$KNFpp|o)0=3D7(RWL~QQy8E;Y
> zYE{=3DlI~fg}5*5H{M6x>@IL>-PBp=3D^YiKIuyq232IR~C3q^<X~<toqNlu+SHOa^`|X
> zO`i{Zru2VR(qB09N36}Bkt&ah!KCqSn>^=3DUo2<PLu}8Rw#@&RSA|AHCm|XoMAAgV&
> zF;~#??rmIQGgK=3D0dysncu<b7I0?!g#Vf8dCTRvKxoRQ;IHA%j1LSbQ;yyXV}%zw}&
> zvlLjFKG3xjK4{B|BbEVpX(=3D9x_Mk%&{x)-x;*X2MPsZF}oD&MkS7r(m91Q-ks1;x8
> zW!Ge+yTjx`W1WQ`j6^Jj>M2!go>=3DO)z_Xy}x74cy>_9JszWp-h7rH_nv|IdUP_o5B
> z>y7kAqW%9&S0%j9!mj-+uV($d0__N9*Uz;ZUGnu+EqdIGTjcAjTR6O}!J7luv$#ZD
> zCAijjejgcCb~Q4r)YO459_UnfIy^?)S9{`dFZLL4&-3Um=3Dpj9TtHWMFab(an!5a<5
> zYD=3D+p46Zgy{6O0`E!65Nw4(N*G+*=3DNe+btw=3DVbRIJv27w3hi%~?>c@BdxvtyzgKiM
> ze6_P?d+)S6uhhKTJLS$*HSi#}j6T6v=3D`Q^~GO|ps_%z6JvMDkVv!wP1_uE<;U!|uw
> zZurFG1fsKyBc`{-_SIfnamIcLeGw4TMg1Yac&tC9Cz5|WCev)5wdIQK1h{kO0*a(B
> zzYjXfq$Z|sZY|T-g`M2t+mTwwx_;NMTb5{N`sU%=3DX?#03<XghBVUTGDcV&I&F1a<n
> z?8;516ft+`rK!VI$+#U?u+Ov8izuicSk@r7+*0foLt)1~We|vl!uEnusyvoB+sb_S
> z!iz_)8gYI&xKDyV55CwL<%m2J?p%>9Ovjs1xTCxo_e{Jq@WYSXJ7VW>V0l9Etn$S|
> z_KI|2X88?!8R%&l^-asTo(3I#L6Owo5|;;EinK+tnKdE}NN3i_w%hWVHL@LEmWNt7
> zSDrb${C**){G5Gt?cB{zHzoO3Bcd4a{49gu`P>3~)Rk0W=3D+K?l`yU66#bIVkZjCFu
> zg1v@BZ68Ma$sNg+M3<zNPb^VTndNN@(X)k0&&XS(_G@`?-axMw*S#b@)~0cB=3D6T4o
> zsg`lgbiPH@?(~K#?5oeQMz*wUtg=3DR2EeU(9kvCfI2lf~TEXXffOxm4dHp-b{V{8=3D6
> zX!+~9q}`juT<Xau$rR7*T;7|hwAC5;iKohvcWWe|{09p(`ntbaifc9NOaixVxWKOC
> zTrKtt?{Dg!tb0p5b@uVI|6xh@R`tDISJn3v`nad<@wQS6cvIvz_|8XG)SWsTwu}c~
> zU+<yu7JA?>a=3D#hEu37kEExxM0eKm2VZPyw?ko9Xe=3DbjC0gGH+$_-3d?@xc=3DPEo_DD
> z2DlxQLx_hH4T<6RQt09&L$I*-FWH0mC*VHmg9;wOM#u*ul7{?UirxqvXa(sMs?UnJ
> z`>}sv6*(Zrb4&8SF2Fp(3zvV`_;g&!pTvaj(|4N!;Q+fP|HF|}pv?zgF3=3Da0<V<dI
> ze`Y^eT;t4<dNhhH@s2?LhlBi93(J=3DQ_F5zCwZ_V^kh9bi5H#-P!4batFhw?YM&7K+
> zucA2ftWZNh>e0IB6sL??QUG-|e`=3Dxl0VS>#RzYJ~-VH5q2>KBu9ooM|<BaKzF?ht*
> zImL}@{hXGpFKOVt>pdDLERexr;#PRjr=3D%|6zh1Nz`&jgg7G&GtshV?ukMMQ**@%o>
> z#=3D@rglK5z=3D#`zdD998m;gTy?%b<7Ycd(hIa*OCsfQ;e2(W0ddGs&bjVFNAT*Lzf)6
> z(11FhMxCWEgx?Y`o+d3w25t;(tIhJ#gM)f}Y)mRGjg3T+Si$Ah{tQ$4qaV_r7*%8(
> zR98&yH-KWOkWj3OVv=3D_;G^*!oRIQafF^{&YHBSB?Yoz*O`eBT3^PoX9%M<M-7&&A+
> zNMY=3DX(V`NeJ-}a6A@8j^xeDJ?CAQ?cWmx%G+T*53hp^Z|g4JX)C0|&CeVnu^o4kC$
> zt-vi?^*#ns#*cZog6B%1E=3Dykd!*)$A>wLJeu)82*nfGDe!`Rg#fk!Vx-3D&nQC4CX
> z@jdfC%0J4Mk3r;Wt}yTDYS+&K6ya_TelUIYQJsGQFiGRoBf?4BKd$V92uXJND9=3Dfa
> zmbvIvOlt13%>gZn*Ye7^qUDz{qvZn@jr#{^#A_as=3D@`dZ%U#}h?T)%03*W;?8!U4H
> zk2#0Z`&raKzEtn$59$1wO1qr@Bg?$<*YWlBTM1=3DX&^mpE-4%OtRKEd9w4AiDDsKIF
> zfqN=3DW7@3voHJFF3A1kChr5DWWtzN{%+98*h6j`k6Q-sOupXncA-&8fut22|tQd3oA
> z*;GZ518m9tcpL5g7O`4iT0Xdw^h-|BFUh|7A$VbUj!oIi5{*V*CR##vz}WgB8D%J~
> zam->AU3nPf+okX;Zh_uBZvo;5@csnS5)}J-LX%LdV$|Ybyb{gEpQd#>l#8h}EFJAp
> zT~sd5^Z&hE8p=3D_7TJHwP$1`r4pJD}jzO~zadC*tJwR51DJ8Ee)LOY0*VrR;DdtvS{
> zvU}86Qq4a3VA;Oy!IbI4(vm3N)-Bg_uGN7CShEDhwpg4)nm@_=3DQh3nz65CgDIt{j}
> zA^SJD_6gn=3D*kD=3D%<9(#HS?%wKRI2t)4R*KGsMc4@_gX5$i3vm7BE4g<t@lG*9yinU
> z-h?kx!Y85ooj5N1>fK-@RkhO)&7*ZlJb?NX>kG{n$qB0M3~@K&NbK~9uGw?f+~)1s
> z!{5ug)(`-+|1e){2)vP#-+UlDE6{)#Bb(UJV{LwW)~oP=3DZ3{H?P_ET~n1TIMbN`^3
> zu7jLL_A1p*MeR~Mq^HGrMP4oG1e_S}XTaCDw7k*s?3tRX4J{j6j<yt^S>i1_v-ZrW
> z(ubNJ!Wg6O_zL1H%$kLrc^<<h{Usyz$bIY3UDBd7<L3PFh*$k?QC@Jo{by;~$_Koj
> z7JG}XviOX?^2gq_XAG5PXP&{?N%wlEwP@1r@&5h{twH0i0e%Bb)lke;Aky8nu=3D5p<
> zoVzu+*|RP9s^``0F8EjqdryA(fFoKK3Rm1+*gFZb)pBv=3Dm)cLX8s0-32DVX~uH&J3
> z(Xzr`<1@pAZ^Us9!<|>>eRlT)jwi$k@2&ij|J7K>+<D{PgQWB2*J9@xgHlG{!In*O
> zypjF27(&#=3D+jmcLuy#Yo&k;|%wRiJRO!gETEB$W=3Dw>K)aig6EZ?d3jUC7bw$CC>JC
> z?o#oqtfk_!Vgwr1w+?pAH<o9_9htiZ=3D9pj|i{Y75WRo$s?ZE3uppJ2hbh1o|DL67!
> zm%e1C*_U{A74}voP1j9XGSh@##r1y->ZhC1mduRDFQI;WP?u`Yi^At%UU3C>b#`D*
> zl{U8F+?3*?RfXpZ+M}g$iy1dXx^vu9h_?K>lUcJBJ`U`Gke<MP_a_jm;H+m#8R@|e
> z#`QM`(p^7tFzyEtRV?C2o29AkcQ5sYuXfc(e^MY6*GJba5NdOdUtQ3_y4q(J0IL`5
> z=3D=3D_x?IR6ulxiWXXeg0m1CtGy2nSTAfbN&v^%(y?$9JSBnk#~aV?i^Wj<yYbEk*#J|
> z2q*TCr;=3DU6;ypg~XW$<!exny(8PE%M4JbIi7*b{6WVFN`aEIUr3bAX#I3H5ZC98JS
> zC570<xL-3reb}DnV<+>igi|)}r(*LNzNU6&b!TB{rRZznH1S=3DVTQmzgztTIS?uKsK
> zDfyB(u5m$IN~=3D(v1n4r6;o8wnuowo~MWbz0Q@cnhqwt&gfUJWYSG2cqX8~mJsl|Wq
> zy!uWjaN{LBM~jKQ^LJe9-e!#}z*vLpFy9oX^%~~kb-HNY@!X7c_ByUm4Wrn)C?+;$
> zS2KAjB2g=3DvS0rMuys>H9Ri^ZVKezn3_0QHewoMN&5a;JARNEO@&UOwrDs}$!p+OtP
> zeCp|%`97v5!M_fc0!GRQb}g!7-4B8e@U}Vc&CGuE%Q?qQrN&PRuiZ0+!>)p5X>tu)
> zdNvfrRhYH$E%uR7cFt+IP}I#IKih5U(EArcBgzFwBdNdktE4jdW=3DiQdZqn1^BvYla
> zVrK4^t~qrw_`Jc!!BU~M$<Tz<v%S=3D>jI{Ccrpw^y%GoC7Cz`OcBnkP_L@V{Ub*DHj
> zZ6eOPm<YQS*)tdi-4k{V+AR#I{ftemZPNkWBd6_#3w)iyP5s+~{!vV5obx!&iBo$x
> zuJm0?LKEq1jN?-a#U3hiF)$A?zDTg6`Pqt#;^rt0l49u+y*qN>>e4)K{}t@;&ztO3
> z@9ylne<dfFor;h2EX89=3Dfp0D9)7m}fzd*xLM{F*~D07)`@s(<gn6Nv)TFzykM?47a
> z0}hR&Qw{?fw|Pa9P*%OYn$ywlmbb)`vm2Gu%s98&YqI_A7<zVAsbbGWx$DC3=3DkzFJ
> zqJ0%7m)T?*2lagdo}?onI?@$IytDI6ViUVqsm~2N>7h7^LkC2lZ^Ft(mv*la5z8YG
> z7e;zR3{MGn2_^&!f}4W3cv9Us4HEHB-}jp<d9jy6@m1mcNUj!|_slt+%80wk9tBI(
> zDI2t>Mej01T_lhAPLKsv7@j`ry|uGXe%X0EsW<V?uH(_4a6--T=3D<_W0%CPR*;IG0B
> z*zfaW2W*t?hM*bo{y!Bpsi^0VacK%X9K_d$#_h)9Oldx1aEZ-J8v13$Nli+>dT5;+
> zFBtbSB^HGSvXa=3DnH8?8OoI3)tg<L-)WX`hJYoHsMQV+lL`v-Ayo{#hMLE|S$<db!9
> z6~?{r1GuDaGoooWibiFegDX@$kLfl{hs;yVrkHX;hcf^_JkGc^)+5+8zWLZxZ{kJh
> z@|W&&+;21ON!*=3D=3DI#YI;S9~MJ3$`ZM4dK07)KC^I3}SZA(kd~1VlJN|nD)MMjOjD{
> zWQsk*S_^;nlDkIx&RtE}bEVDG*4(zKjVUEclHgCNFkXnisK*{ntzYLfd_ubmr`<4>
> z2{&|D(}XFSA#pC3GotRx7UnBM+21U~KyL`YXgo366I(|y*@1DUTpIp~L)0F>&!L%d
> zkAo@swb(A+iCTws*hE8nob!$o`iq=3DjxG}Mm&Kae(`i*i{kybK4*Dg-+nuOuIhE*n|
> zrDI0kpi?G$l>JSSMQwvR=3DqvTL^(mEcsSdGL+$7G-8F#|ox$&c#kBk@NFW8SxyOD@G
> z4IRQ!jikM#??|bXZ;UF{b!c6n-yL&~n!sa{ZOMoLH)V4E6Cxueo>EpwSt2M9y~+F3
> zRq}fajW;&N*gO)hJFxC3)|O}o(G9}07!2ke{|x+}BM3~n2Rmdx#c8XriKD$Kh|n@)
> zu54neFf(_g*LW$uo#>`{Z%U;>nGdZ~|A`K|j7FMvBdM$zdNK6|v+@tHP%(cHBGga9
> z_o02IKE>AKX!xgfV)gNHQ$7^w+yus9USSqS_?BS*)T+AZI-^jGyI!!@8L;EYm{xp%
> zEkKN?a?-03byWJfg~OLyY4S10Q(xIP9$*VMUhd71rENj`nV<qEYJYy(oZ6Xyuep4V
> z5L<Irul8bXKAl;^U9^dFk8-=3DUd)V@6_61dO@GR@fCqlOyVdsz18G3~wh1WVv<^@NM
> znM<o8Rl-p|o4yqFDl&D5?mLH2#aOun?^R3eU4>3yU_TAfgOQKg<j-*tjqG{MCcpIf
> z;C$uPnlG4llg!IVM*pKRiT7|!;$1o*@h)jvingO}Mc#FS3Sz%6NxV9oyv39;?!P&V
> zmERSt3Qt0ugvQ40%JX%#ZfMo*+SI1s#rt-&8Fu}mO<T#O#_zh{x208MyARUtFU23D
> z&fESBMcy@69PWCh8ZxhQtV7N%42jkG)uXWkvM97%EDX-CE($KJ&cLof6Rar@h($f~
> zXMO`Y$<*`XFYj?gOGZ0Pz2&nYNA_?#(mO|sS>5cK!XB=3DjovgbMExGf-tZw7-kphc+
> z_lRTgb-crn5%(ZB^B%{&qUFToPUh%nN9uzkPLPFjw8(sHC}-{Z3yZSZHCd2_<uy_d
> zJI!!mGs=3D$^rS8pZ<LqpSwmrTb-<*X(Huba^b?S-=3DVO4*@qOIIAeY+C(r>q^&4dN>#
> z_Yxl&>T?_e8*dC(O(zl?|MMuFo3wo&?vdJ~;Dh_(y&QJIOD+TABb)o4YZ=3D7N1+b0L
> zInZYl)U&K(^^8C?K4INNX~fLVuNcUC4@4#vnNKx9GU4CGEV@pJQg|YK6grVw8!t^p
> z1Q1S*-ACUf*eS+;@4Ti*&<33+LVZWHRgGC9d1pn9p3Y$kZp3L<#6iIq$rd8ru#Cr<
> zSl!UCLb#|5PTImZibyTP3XGG+&wQ<)DGPN+B9k5pp-*JZL(63*M5L-Y26fd~yeZXV
> zK-*Td&Dnld18>cZk`~nm8Pm$CU9vy_1@Or7Awsu?EsK_h0%rr6O*3sCoSs$~J`3N4
> zIo%p*sI^9laJAvuUR#ATagSdki#W;F+XBM%_iH$bEo}&$4Npv;ktSR}SR-8j4X(?$
> zUaFCEt7dPzRyF%vn9jR99<+9^!LCG{u!j1tq%Uh|Y~Zms;CSHA7V|*ar%>+S2g>3M
> z^)P*<vLsc}J_PDF_5ZfLuf%l01gTxv7?su`LJg6EyG$-Tp*z#Q3+C3`?5HarQEXU)
> z_+5&)`?=3DXVKYx%d{h2!vbF1&rM3}Oo-ZhPYEi^`cKYfAkPGZ;UEAJO3TQzH!32|#h
> zL0f_N+qDG)7OSV5aGu6SIieTVB8MDFLLNC{5n|D^O+%txskIlC)^r_w8CMzXE$n>&
> zt6{DP*#NP|{C)+aFt0BvE$b>jwhWfxI&_sE^yB1~(iiUD+WYg!q{6L3%BUr{$`eWn
> zbxg5VLV*X$Lcy!lN^emwwZZSFc;=3DtE&ko7`&+Cun{+au~l)O(UIBA8BTi6@L`GfE#
> z9=3DJoPlWKgz9S2yl3pNbN+xZo%<j$Q1OBo=3Db){uOIQmwNJdoyPJRY`vwHJhZtn!`PG
> z0>`8>{y-LLe%x)6{FWGgXT7S@hT9nZy|u+S{(`miCtNXm<w|k6$BI?k06lJbD_gr#
> ze8MxStfh9X7z#GP8vl~`MC;j{(U^;s;tJ2GnTbdZVaMM}@x_)WJ#9I$Tu-*nt)1xl
> zUw08Ey(In|d-g)GrBL~&5I@buExlS&+YCHy#+i;Kv)!Ms&f(nu9%S$MyxWMgHnaum
> zyE)7}niAyg!axL$c14$cr5N!%>`9h7@7@ZHA#!(7?@Dng?cH~cZsgG#{a)sYx&V=3Dq
> zCCYDpKT&{UWj<DlH#|f&I`59$&6ciGX2I}@VJ|r10A^9%RZ8ALA854TKcRn8d^*8(
> z<jLl~vcsSO&Jd)=3D;itx?ZalI*Hx$C^J`6j6v^6~9j*;+{v(uAc?_*Qh%%pUpGq6l6
> zR$Y~@$w%JK{lcPeQcwPit<$+!tM}o$fH^rB7xPa*dQ#4)yHjFj(%BR7zJ`Elrf@J(
> z@sEST2JalQhb2Z=3DWAegi_>PSik|awb$!mrP<1Pv-E2zX2<^xF*hqzOm-6|RPm=3D$`B
> zeQDSD{paB0rBwB6l4OXmDmCA)mKv1GW9`NGMCOS(IAw^=3Dm6}E)j>tHv57DxXpq$lg
> zY1Dld`%|Xb>{T4Fs3Dk`3Y+c$Yvh+ouAzA>wmj_9fu*wQG0dYSGY`J2w~>NVM?tG$
> zJy4)I$hYPwxqnebF}U$I_&}BKN{#4EXC|+Ff2)ehQ|uwp#dg4%V1E|R)3`pu6&nZb
> z3rM^|T%@YTsH|43W5oI2v=3D6pP{L75k=3D3iicVblqIKa_MbIc?S9#HJT>&IWOAk#eHZ
> z_h;UI*wFNEITCgXe4j=3D?jQ%vE{USVLeZZXUH$cBIURvR1OOw!xgioH##aW@S(HJTp
> zC^3cP*7!;jV)hVYyPqgVl4QL7d%5!a$!sNmps+ikf*Hc+372E-tcCQxwoz><;S;v>
> zDU@U+VLuB>kCg;EucSeu6ZWyCkGlC_626*-d>u%`SG1~p)hT=3D;R(c>6-$B3B(%<_&
> zkc#gsl<$U0dVAq+P;yXXQ1JpOAncFzhHB_k^Y$ho@}Eb<^#g8U|JFc*O1YIDt2I$R
> zKnD4Y|3f}}9jFhzM81Sw)GAxL5Bpnw*z({w)Hhv(Efe-DRDJ+XgE`bOnf@Wi;8<0t
> z#s8oNH5Dh34a|c^;R}OYPo14XEL8Uf6Mc&Dc^>o0mabIhpI5w&y0ZIy;G73BA8UwD
> ztaKALAyOClURLr!6aPUOZKW17%pV-g4^BClf7i5=3DSphj$#(wLf5Wi1*;Rh{N>W7pj
> z%p6koAKKDY>i*~4mC1BoW6s(f9x@AaGY`?D+Dh^)7F;#@;&)(m_fJ|R1wh5IQ-Pw!
> zV*HO`@K=3D-~$v8eXnTg^0{eX>%=3D__xqDHTR!DZLA4(5W~}l8p+%PIb({48!gRl%00`
> zhm?k|NK?zge(rJ)td+r%gCmYd$wiQb_zx*<=3D**xs*wg=3D686(Q9_@`wAl7LW3sR_6{
> z*iJ&_0}@&pvI{N-i`e)_G=3Dd(KfGdU#7mSxahx|Mj^Uq4g3M)oz3UrD2*uz7oNtv3O
> z5p!N!R~3;D(5XR&N}`5{Ef}(^Tjh%}o#80xR}2S#1G<>(!QT1{YoTZ9I(`j46er?u
> z5mdh4m?Skvl2eH<yd*AY%gg1RMWLOoN9$F-M7W}_oGB4s(seL6e~>s9@tv8HPT^Lw
> zB-pWUr_LHky-PCOPP=3DO$EeU5VQ44cmVJsYIgX&l7fzS1JiBySk?Et-{b)oAR+OMrA
> z&@=3D2Wz!&H>_o8evc;V{13d84=3Dzjsjx9S5nGNIIq*|D;W&v~Eunywy~3I#+jTXIE7N
> z)j3(BRGY*uR=3D(WzX&0qdy{oT8%w|Dh(D39*yISX4;)1hzIe=3D8~xzk6LvTA<_7C5zR
> zAL&{O=3D7#y;EKp}YI8(wYXbRUJNJq_ps?tNXHU%m{ejn9H<HnBj+kdM=3DogIy|plw@V
> zi840|1W-pZaRx<>h_#25eS9zx=3D^Wr0OT}-bCQ0yPgErTP2fu)O;LBZ7oVyw6xBGqV
> zF6`^(!@!RH*frq>T(2c5DY1D%&59<O3XGouc_smKVNgb>cS81ywTuzsONFY*<mc-B
> zrV0h#NS`d}k#5?>f?iNOPE{Sj!=3D~h>G{Xv=3D|2)p8C5=3DY=3DgWf^^QAW=3DW$U@W`Xb=
9nC
> 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
I
> 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
>
> literal 0
> HcmV?d00001
>
> --
> 2.25.1
>
