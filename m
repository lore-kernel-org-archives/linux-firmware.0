Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B53AC369D5
	for <linux-firmware@archiver.kernel.org>; Fri, 25 Apr 2025 12:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D6698C4CEEE; Fri, 25 Apr 2025 12:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7148C4CEE8
	for <linux-firmware@kernel.org>; Fri, 25 Apr 2025 12:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745584501;
	bh=YRtXpnAe4guOYsisWm/ta7cPF55IKkgKvxKOIqrc008=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=bsYrJhBbspc/bXzGu7kbcXKnlu3DZBh7SMD0NjlFgwmz68g6OhDyx6MugpuycPz+t
	 nU3l9TkYAz7VyeRcJZBBOZBQpZW8E1+zrclEvYSodhaEibLK4bvkrK7uaL979AiJ8c
	 TgojKdjd584ca8DrMP+RgoRrfYpNBux/Epm2w0Jx7GQkmR0RzajqZb+P80J7H9VXJw
	 gm76rMC2wTcSp0oNz5wGLOE252ZFOjByTNvpQcDS+K5VD+Lba8X1V26+EW3HB+cfm+
	 453Ms9C6jUXOLY2/XkBeMgp73NoJbr0oinw6eQfxSWr9vjzlGcxVzkdNN95rX2oEjf
	 ZwQBad8gEySzw==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ff4faf858cso16643267b3.2
        for <linux-firmware@kernel.org>; Fri, 25 Apr 2025 05:35:01 -0700 (PDT)
X-Gm-Message-State: AOJu0YwW89ms053C6IZKV+doGHCMV/NmUCvDueyvDKwR9C8LXX3hc34v
	7R3JacYJpoekfEJJYga3lRJYT/ikkhbOu+8PdROFzAVSjLKLJ7/40vG4UnSkAYkyj1yB3WI+LfF
	7ftv/2C6OyYZlaVJgeRccSo5GjJQ=
X-Google-Smtp-Source: AGHT+IG2L3zBmNvCzVygtfNo1VYd2Vd47mxQSYuzOfrsFufAb6/4LI/rFsNX4whCnY78yd8BrviZ8ZfKfb8ciXNv4FA=
X-Received: by 2002:a05:690c:4c11:b0:6f7:55a2:4cf5 with SMTP id
 00721157ae682-708540e1087mr27973617b3.2.1745584500727; Fri, 25 Apr 2025
 05:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250425064458.590779-1-hildawu@realtek.com>
In-Reply-To: <20250425064458.590779-1-hildawu@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 25 Apr 2025 08:34:49 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6R+PcAMnyF34DA=nVofzz2M90Rg+w0EJa=vFYb82jYtw@mail.gmail.com>
X-Gm-Features: ATxdqUEr1UQERtNqOoVH-Spi9kS98sUx9IzSoyrWAwmyDpY4kZLsqcwaRg2NiUY
Message-ID: <CA+5PVA6R+PcAMnyF34DA=nVofzz2M90Rg+w0EJa=vFYb82jYtw@mail.gmail.com>
Subject: Re: [PATCH] rtl_bt: Update RTL8852B BT USB FW to 0x098B_154B
To: Hilda Wu <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, max.chou@realtek.com, alex_lu@realsil.com.cn, 
	mu_hua_chen@realtek.com, kidman@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/529

josh

On Fri, Apr 25, 2025 at 2:45=E2=80=AFAM Hilda Wu <hildawu@realtek.com> wrot=
e:
>
> This firmware patch update for Realtek RTL8852B BT USB controller.
>
> Release Version: 0x098B_154B
>
> Signed-off-by: Hilda Wu <hildawu@realtek.com>
> ---
>  rtl_bt/rtl8852bu_fw.bin | Bin 90621 -> 92933 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>
> diff --git a/rtl_bt/rtl8852bu_fw.bin b/rtl_bt/rtl8852bu_fw.bin
> index 0842a2bf896b881ad2ddfa86feee42a0b384ba45..3c67bc6bb7ffa49cb46916c17=
64c8f3245e4d3b6 100644
> GIT binary patch
> delta 17953
> zcmZvE3tUr2_Wzx{2q8QYf#3rP5qzLlM6qh^_6leL@zv_CwOVha?8T6P#qMsq+itF}
> zzC<frF^YB@0#-%rLW0`<+Ww5MtySD=3D@KxJx@wJN~Xh0rqcf0(*b5Yy>|MTbL+&OnL
> zb7tnunKS2{IoF>~C^ueK4tZu##-hxU(t@%5lgWQ~6Gp}`3_-eVX&jQWDI`=3DD$uN7q
> z^DNvHE)%&;D)EKQYWww|)*a$wtF8yt9;Cw=3Dlh;ia&R!2HnvguZ{>cJn+^nCm9SaU~
> zBYC)M$AWQy;{G2f8fDQ^+0RfE%A!1Gv>1SBTP@18QawOf4?r~v)l%WlkOE~2scZnk
> zTLVSFpqxRuw{yOe6jcY~#4%gu4>kiahG|{SKkEwe{iVO>m{sNc%wV)wzGZ@(>53Ik
> zY*`%R?W46quc){6_azj`auiBuUz|Ap-JEo;FUpMsyuXCB4IEmu2HC4zpV~c3dbS3$
> zkYi+h3h}_ZGwnveNN(<$v5#>h0msh}(>KhGgtA{kaVVn%#Pbmp4TusD&qq)cAUY;I
> zA3<6`lz@0r$S#3ufRuoEK7tg0C;{<&1TlaZkNOICt+jWU8wtPv5{g3^9T=3DXEplCpJ
> zVDxFmGs?44dgkM)^@O}AWd&l-y9o=3DJRjs|C!5Qg!+za$bpv*6!IIMumr>gJ*9a0nP
> z7ryrPM!Ais4`wW4gC;;~H-Dz^j99;Qw4D?cwL38$?wYeVnl5sI6V;JCc~>b!%e8o?
> zMEND8Mj53Eo{t~}AW9QFA3+Qtx@dSlfCLO031xUb_6UpvM2UmvBPbeBv`6irrBQ&R
> z#Po_Wc8+$8Zn<kAB8RS2KKjh}8#_mTo?&Kz8p$o}+TwpA#dLt}jXp&AF+EYWEn`+@
> zV4^u=3D&-4O$uGOD;XRKMZec|npi|g->G_T$B^mTTRFxh%%ZonEac9Uh!&cWuaVARXe
> z=3DBz#I_poW3{Y<a6iA`&sy=3DUWtSEh+=3D4yp7R^r`*D+PmM!wDv^1NfCFvwI>R+9L2Zx
> zfWdpT;`NF#a&M193>Opa&K`vaiBh%)H0hD3^9T}pF!UaYr7c2FoQFM&XA^~luZ5my
> z4}0R_69nm@?2G3E$k>@v9fI|=3Df)qK&1Ykx&KOAr(p)Q_w30w&<&XZ4{c&BvdFmxoT
> zEZXxT-m&=3DTfTxi3yA}+}^=3DQGMT#s6+r}q37utKV>XrhqtHAg4Z!!-R8V$pewb@K@p
> zJ=3DyWVj}&|eVOBlSQrXW?6w0EcvY#O>%CsnpwK{`ajyZ#6$C&Od)yAG-hnOOvYwa;3
> zFgw370vFPu{~L-zSrjd^1MLG4$hKTH_Gk|wNe$KbMJ+W{H*LIT#3DI^i%^3>IhHC|
> zf=3D+G6gli0_hSWqM$P+sFUqDkVOy|5~MV2{!rgQ!=3D23VNR?5hm0Ah|i=3DT5C6?L-#N=
=3D
> z`XvOJ&`nX|`3Qn^=3D%&c=3Dd;~=3DS0%cH!1v=3Di^t!+ZW;I^Vf-Q*04*_A2wbW8TJb-6j=
m
> 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
e
> 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
u
> z5+AaLVl7zXxSk4+L9wGRl_VrEqj}uOt#rNLJ#+*qDmYZs&IV=3D2i_hev?kH=3DyBYh$n
> zYaeQscEa6BZvEY_ZnFM2=3Dn{Wm?~XKm9P8|S<FBRynVa#?<e7p|e?jQ4WiK1%Qx#8`
> zt5Hk?8toOWBaCVjxR*NrzQ!@V;NMU{^CsE;DeUqGROYq2j`H<^kNFP+@a^YPeb87M
> zG|!ASE`6$dI5)e7*o%Jd;CXaFg*7!rP9iv!9s<<DyFPY69#ePBLthDX(QJg}M`iTy
> zrmKb5;H5o<L*-Hft{JFb1p%+gDIvlu2#tFMmSVwE>PH8|lc+y!HX;(gB!Y%UIlVnY
> zjg!ZrNF!5J)P~t``v{vx^h8a=3D;AvQxIKF7IW6LCRu^<v!c<564l$8pdp~w};l^j#J
> zfd5&sl?7$+n(8=3DNFap0OaHLxfPYqMpk#YecOBb4q!Q5I>eBN^oVm$Zcm+s<gi;9fF
> z*N!XU&wlZEv*Yv0WTyQy>eM;0Dex)22Kf}tK7|u=3DW@d=3DVnpOn2*T>MaKE~H0bT2Rk
> z^z);S@EHTu%9w&9O>{+~g3Kzme(W8=3DX7!K9(Ze>o-CXCJt^*y7hYtn-9Tz@OlsJR?
> zyd44IZ;X}ceCIf0aRzg|b?yU)m??!qReeCXCRFV|M05Cf(&BHlJ^q2`&dr%sBv)<P
> z@O1gjTDKPWAYm<F1F`dFQgOB8vvlgXZK|Rpu~ju>2N{ctXLqpvGuEHsX6rT&ePhpx
> zaN26l%i(H~o8Cd2^*kwQzt?(oi<>EAj&E_dBB>Q@mD;yinp>HhIS!61me1RSud*21
> zJ9w88)pF31<SI?C7*Tbrgy@aKDr@Ui_OABwIR7|!dq9}NxgBdAf0_an@J~%|bw)$r
> zXhEA-X@r$+HP6;-5!nzGBy$f+<uAJ<VOR@w_3c05_p)~G%uDVUi{K_cv)aSfz***J
> zPtZMDZ^aYW<BY}jKym$NS6Iny=3D{|QAewSHSc~;SNv9So#Eo|ECXN_O;?tW`R9*tF<
> zdq-124W4lw`7kW=3DkJrX-n6=3DU|;c;RhV;xUFPR8380!f6G6uuT~?;SjPs+)7!dt*jS
> z!#N&3VrnD16Pj!<l)UpyN%rAJp8B&GtG!ntX?aiw{ld-_vCQ%1u`7Cqj2?}luIP<5
> zv9wmfv#}RP8!D7Vic`vB?)X{U_Rz=3D(x)YySv?7D<Iz$}WrL9NfgkMIYp@;N}hK3%}
> z4<KmFEB%;Z3OorkyjV@0Gw`tX+yC2-zn>lkc2O_E?`9#Yeuzx^+#?G0sXj>cLaKUE
> zuPnV78Hn1_3p9djKu>e5o=3DQwp=3D%)w|&3=3DaB@9)P4qfF{>cyFn=3Dc>NTS;ujz2bdpN=
9
> zILC2vD#?wdpCC+a!Pg#$HxQCBLBLG1Bb6mpcKV4zoNwT_^GW!u0q|<%8xQIp+4M}U
> za<vc~#Hp5qatc5QQnviO<<+aN@|uxTRwK;XYynwSR=3DVm;L5HERaqZ4QmkQk)T*qrK
> z4-&Q8BTNNu)n&zHrEg-%=3DAI$NKiX}KRl4FVAePI98eUPn!ULvn*S0L@jlp9s$~Ic@
> z4T#e0tnYK{{b5U&95R@VozL%)l?42HQ<#z}^(tN~>P_<>x!5=3DKXi5(DgyT$-S<f4c
> zoeMTH&wR-#N}{5c^V=3Do+S6Q+oknMi1(5?@>edE_v@1e6ymob=3DiQnT%I*m%rISsvRS
> z!fPs7H#yY`6-RHSdOuTKZ_-rK8|Sq<_Znt+W;C(8<_3hXpJ>8v`1%Qy6KknKwrA!Z
> zCUtIG30pYnardelY#o6gBn2{PAxx@bzcwZ5p^0bj9A2_MNFBO~QsZ&hTJffFP2SE~
> zwGTAtThOrT=3DOLhXMW1T)$OflVzTChi!y}d~dBg@w!-CT;m-W7202bF%eR`A8z0ftJ
> zX#m4N3^ldv34|e@I9gQS&U*7tnhePw;zJTFu_ibM-$*#Y7oR&)Gsuv~sWXutCsV;=3D
> z;4c~F;g72rA&<iiz=3DJpy8cIsNW1aZcf`*pj*m9UN$eZ%hy^)Ug43ZAO;24of_C`Ep
> z*||g1Lh^@>tC{2-66MIxB8hUQGr{p@7KtC~p^ioiQ#kKV$CySBQ{y*6$no-de{K4!
> z<0vXjh!{b-6P707Fc|{xkQ(_gC?sdb)*R+KH6O@etDiD5R%b&<3)`l?{JtY>78#Wo
> zE}cQnpc+1;gwh&wg?n+-8@0-1<IUx6rOkO}tK->OBsuggw{U!|+gkUgW9=3D+5$iBYm
> zjce<h-n_<jzT;X)DO<4Cy%ixE!;`3k6JCDMcZf*_w~fL~?cj1=3D#)qa*p=3D@cQmT)8g
> zs`ULP(@m_e;Jtw-g$r<hciq5A<vE5IfZ+#VfH%gxTI%5;hNVrbsMn&AUp0UNDl#?a
> z8=3D&vXtx#y-Uma`st<<DIs!<@pxo*Za82-hCzM*C_O3L{gd>DqL^2z7TYNFc%AwZ6d
> z2g6cYpFzo9US*IKamVEb`o<LY$7a;(Z6T$OhS_BF^B*C|LvQOfGq!F+3KmBuEzWnn
> zL&r?V@_g58c(6dpP1GgN*o<DLL~((-r=3DT2IcN!88VO{nRtjl-3#F&7K5p_%GCH8K}
> z<uuVcGQplqTNUq(mDkcbM|)*P2~Xi)V)JWtw)vS+OXb`Mcm8qUdq9J=3D-3luQ@l2&7
> zm5MZ?n@UtFqVIIeh4?liN#_ml?Y@CTrRp{$My98M?c}{ax#U2-4VKr%N692nNJVV=3D
> zbs}txkO>Db6X7K{HL;I;|1>EkvroN;&;1;@J9u3ue6}5`)gRGvE#lqZ&<RP=3D_=3DW(f
> za-&WN#>2Kou0Tj``AmGThVq#k5N7*l$a<5bK8Ki0@gijEP^f9hsoa0=3DmRvY=3DLyiqG
> zunFsL9|`7=3DKg-Eaj*_|Lar^iAkt-uEgr8sD$W||Jc)^n+#d>I3mLJOacDY+=3DH5LnJ
> zmeJ2WtY`1Cb!Bj)?UDjp6Rc5wWo}+z_MT?Mfy_QdFNc@{JSBgkMugUJY;Di%eQSHN
> zVCbyv$@Y4KJ7E_rLHeH>Ve(u=3DqC8*Yw5L1M4+fZC8V@5taaEeKaQ~4dE%nczan8ix
> zG#9Q)mj)wvXXlcu@W4As@k{(UI8C#>t-<Q*)*y?tuG*PCx1%+fSuIQ!CT~XUEt_`G
> zzm9JXOih}2#JE=3Dm<8^R>x3hkq#;h4P-fedt_kKPOU1EloGQTqFha{n!O=3DEg8((3#P
> zoZ1KB=3DnT0ev#NX}AoA(QFc9>?_>!*fkYcI;jo@MJy1boxobeE(d8grz>2TJ+#2<vV
> zL(OSA+-3W4J>YEZTyQ!@qLM_N6EE?r4ZX7;h&lST0nw-=3Dt^6TlT^OYjmf^C1!EfQa
> z7)d0iBcku4u%D0T9R_?6*spX{&m)WF+WV1?ALfxU^fokUJ~>S653V@R$GH{!C_d&A
> z4fBiey^e6T=3DguxY`~2Csv*8snm9g8k4uy}7wwzzd>rIiq2$;^Q^J<^=3D!JK7%+LDak
> zC>$N3s3o&TiUXHynLG{ZV+s}*sRiA8RI(4;^J+bBz<Z)~Twg%0+Y1oq@o*r{df`4(
> zM2TJBKD}UVadzg}yKm(-`@iCw{i+nk^7Gvt!G_hOs+aU~NeJ$bwDcF3`I`}Lwa-1%
> z#dI-i!hNI7AHZ{1T1QIwwm|#!u{G|mc($(D|8!fxf6c@q_y=3Dw7Ub2rA?o*RHuVc5{
> z`9<yhh!T}=3D*MoVf&xf?6^~7Ud)YMd1+5I6!{k9h{_Im#i6E!DVgW)D_|8l+>pGp;<
> zp}%(_#*5Za`Q8Q=3D>RkBI_7+;J@Ijc<z*e(h<9dIUNuax?L|$xX>t6E&{9!%;H^O=3DM
> z?CuRN|KrW~>hC?1w9pmV5^+W2`xBZo1#h_`9Q`)U%ktt#ajf}t6*#*F&ME&IDaxQ9
> zP^d{$q4BHCn#!<>r#pzP-k+WlR-ry$-K{AJ^=3DT?fdlE2}5TDc%!%!jMRcV*vXE|xz
> zb{SS8u8W55)x*u8ND-<lCN~G_1Iyi!@RUYe$)57uKjF`;Iz7cS@2eXTj!5w{Ty4#&
> zVTv`rj|{REk(LlMoSBGS{?Jcv?#ld{N`;SD=3DL36KOAg{o!o(=3DkTsI=3Dij^{ybU~H?c
> z_BnKR#aT_WYt^=3Dc{@EwPM5;H3wLI>|IN^Q^6U+QEy6=3DzEam%Ejd_X7Q6|Rw6?b(}g
> zW4GXhc3XG_$yTS5n{VF`c6d9Nod|2mtYv{Q^CS)N(rgP8QHo1!xmi=3Du+BxUMM0Z+4
> zUtfY9pYh@AG}uNjSSPsqdlPJkVy<I%B<8VxYsVmisWI6jRC{aA1<E?U>t&Kh9Tq;2
> zFFV>h)V!5XKBT=3DIhA<cnLOn+uVejDr1ioPHc6&C-W>2uk*uSY$Rc>;F+wt&w87IOc
> zqF^Rd#omY0;oG{!cfWnOEv}+~+TCww4#alpo=3D^%=3DTD>rFl1fr;THhMD*S&)fKB@ri
> zKc*61c<?bC{qBz{Lk~W-IdW<t`Bp~Cj?^q78#VY3Uc|&raYuf&g4D`}9-R}j3I9UX
> TP^#!(zl@M*!Yow$^oRcg%UI;D
>
> delta 15496
> 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
e
> zbdM)bg|_1H3cBc4JLWu0;N0t$Io3Z+28KJksf9F*b0Xu=3D!z6_e$EAnK6e)HvN9+VL
> zE1|UueYup@e81oC3`D1@wn7)$@bJO$@&uSj@s2$cNXi@@{xjAW-J%i<oTw|?^<D9e
> z$9oe?AL>rTc0n~K)0yv7TnO<R@x-Iwkz<5Ej{04qh3Ar0)yz^{;&kRW$Cc{47)QcH
> zGAiX)4E9$y(-i}q6|sfsQhFi`j75$!tIXTlBQHG>2zA&dk^#CCfe7@%-jY~#j=3D0KL
> zXnIwl`h^6?+Y^b-KDC!IU<;~CDaCHqn`ly1pWtqxW1a1lxWT>JA*rQ3I!#riL$y`m
> zRaa@Ztm5R}s4Db;I#Lct$sUD4Reha1&s`N;!3@W~e!OvhJM}ryq49yPeV0&H$*HO@
> zB9+<bHo<h}!r9B@b>=3DmnM<$eRT=3DWayb%&ac;p=3Ds-Iq>-2@46+}W~=3Dtf#bXlO+U;S=
_
> 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
>
> --
> 2.34.1
>
