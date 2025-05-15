Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C76C2D0CD
	for <linux-firmware@archiver.kernel.org>; Thu, 15 May 2025 11:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0EDF0C4CEE9; Thu, 15 May 2025 11:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED5CAC4CEEF
	for <linux-firmware@kernel.org>; Thu, 15 May 2025 11:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747308955;
	bh=QNi0twhrAF/bKGXIBDsOM8cjp/j5BPCbY5xzCQGUHmg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=oDyE8gbsr32YB5B0u5w4MWdP7GrxFLJqUuBHwkZO+jf6P+6N23V+crufEs6eoGYAH
	 3qxAc6v4/mlSArqLAWjqp/QD4AMQemqGXChGq8XXjYeK3xyfEfs6A6fqMyjPanakD6
	 bWHXeVSG8OUZjRnbha9wyCnLfOGXxWAcqQ6W3yJdLZ1HXUDr8jCSgmY5BZJz3LqmxV
	 2RkmLydCgUM7WpGV4IZ3f47l3uO53MNqleZz4MYzsLkgHOlrJVpQ9tLMssIPVWJhHq
	 VkcJ6E7FxX3MXRneEKUUrRcUXrZNOGZiBGC+oHaNOSzvD4gRlPJhlfsYjNMn27RdOm
	 fcIgLgl5TFjbQ==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-708d90aa8f9so7707267b3.3
        for <linux-firmware@kernel.org>; Thu, 15 May 2025 04:35:54 -0700 (PDT)
X-Gm-Message-State: AOJu0Yzr5ojHDuHlkReAwdDzwsy8e2pnibh3QSvfwtwgClCzR0TVkQGN
	8yF5FNUiOliPVp1ZLJuPJDKbI3B1x/aXVjBBIa0CJaCQ4n0W3q3RgtjSx9GbY1eyTpfV5YkoGpA
	dfflo2+VQP2/RirenIauPQ+CbmOc=
X-Google-Smtp-Source: AGHT+IGlW+Oxua5xuzJ8FVAdOkunkz7SRT8UjmppPlS0umVjPF6+wQcpKDsGfLIxTJDO7cTJnj7s5k5yiKR1gSOH1kI=
X-Received: by 2002:a05:690c:508d:b0:70c:9364:2c62 with SMTP id
 00721157ae682-70c93643519mr25338737b3.25.1747308954164; Thu, 15 May 2025
 04:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250515030153.4521-1-hau@realtek.com>
In-Reply-To: <20250515030153.4521-1-hau@realtek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 15 May 2025 07:34:00 -0400
X-Gmail-Original-Message-ID: <CA+5PVA63Z6R1=mrtE59kEcPywGS6Pq4EPXMtAKHtGxCdvVpW-A@mail.gmail.com>
X-Gm-Features: AX0GCFuB0DgKulGItRYtbLw0n1bRUKOqw8XAgIC0DCqHaLdV5Xkhn6s1L2UUeXw
Message-ID: <CA+5PVA63Z6R1=mrtE59kEcPywGS6Pq4EPXMtAKHtGxCdvVpW-A@mail.gmail.com>
Subject: Re: [PATCH linux-firmware] rtl_nic: add firmware rtl8127a-1
To: ChunHao Lin <hau@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, hkallweit1@gmail.com, nic_swsd@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/546


josh

On Wed, May 14, 2025 at 11:02=E2=80=AFPM ChunHao Lin <hau@realtek.com> wrot=
e:
>
> This adds firmware rtl8127a-1 for RTL8127 rev.a.
>
> Signed-off-by: ChunHao Lin <hau@realtek.com>
> ---
>  WHENCE                |   3 +++
>  rtl_nic/rtl8127a-1.fw | Bin 0 -> 9632 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100644 rtl_nic/rtl8127a-1.fw
>
> diff --git a/WHENCE b/WHENCE
> index 29beba1b..825a7d21 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -3632,6 +3632,9 @@ Version: 0.0.4
>  File: rtl_nic/rtl8126a-3.fw
>  Version: 0.0.5
>
> +File: rtl_nic/rtl8127a-1.fw
> +Version: 0.0.5
> +
>  Licence:
>   * Copyright =C2=A9 2011-2013, Realtek Semiconductor Corporation
>   *
> diff --git a/rtl_nic/rtl8127a-1.fw b/rtl_nic/rtl8127a-1.fw
> new file mode 100644
> index 0000000000000000000000000000000000000000..afd9578a600a8c1d9fa1bfae1=
c5d47895275d9ce
> GIT binary patch
> literal 9632
> zcmbW633ydSmd9`2OF{@Cxg;e^K=3DN2cWCBE>8QdNa@qt^0rumd{FoB4mh#`bUL_G>0
> zn+VZSL{SVvtN1|@d-5S}Bm`s_Kc$go5N+Fek<~2$L}ZC%e&^o%-~p2E7On4`syg+r
> zv(>4(d6s2ag+&wl_s;rV-oNy|yH{qf%)WtMeS7xq(=3D)3tbNa7<7HVo)ADop86y7r}
> zGcWK!-q=3D9ir2Ig^_=3Df@yjGY=3D7H=3D*!>>3N0s1Pbzs#*Pn+eK7x?K-Sd*vic3Ux}Wv=
b
> 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
C%p
> zLv2EKei%Ewxgl+h^m>JS$vA(FlT*Yhy#seMdxyU#-^EBLa@0qz%_Y`1fwe^U`Nqhh
> zC2l_YuvvY&h&82|$Z|H%picq)Gx%&NYkoQ7=3D0?p4_C&w^EnM0iY(0xQR*x^$zSG#H
> z=3DeNe&L-n`NRqIII0r062E72uK_44x_z_~lq;NqVGUwu<~`rJ8Mn{DKlZukLxD%)Yh
> z;&XX6%;P_0?ybShqvvZg&z;3pQT&=3DHel5J_s;&#;Bh^2dyR96%D(g85-n@^Tx|HAi
> z_^k<k(=3D)AkqyB2}{8f)0kyuC0QsiuFeeHmaPJe@Y?mOV0HY*zO8!?OaTkUm54lY4g
> z@=3DbNsGpx1epRv7?HR{XATJ@#!TB|N)b1Zg7@;Q<d8nZC*`UZWR7$4%?<r9DMVLxL<
> z*s8eeR&w5R-1FjNFU_$FeW!lgOAhT}-MoX`om0V4-2K@1HRl073%uS*M*cJ1J<Gno
> zxizIbH6`5Ilh<5BzJ^?zI?v5N%|q31{~mYj)-o^)ja>V%i|N1F#nim0Bj;+cp@IE0
> zch!b_Id`|~9@{w&j61fXZ&+=3DO^x0G6^n1;3WJ|%SS%0w(dWW~;4v*Z~`-iwPYFi9<
> zvbD-xn-s@el$<<X%6^=3Dw_IuHvJk|Sr0b}#n?*Kkhe|1Dpwduql^e2X=3D?!-RgQp=3Dp)
> z+s(NrhJuxje?NPg^Ys*UY&ZILGV&&V&@=3Dd4om;0YWS$0hD(hmikyE}adJW_|nb<AX
> zan`*Y8RxFaij4Q<eW1L`Q{S(Tj9+7<zc+rSFLj0UzwS%EdzO0qG9%OAm+ANjc>4WI
> z@dNys{ze8UkNkTBsF#&SK6rum20q#L0X#WiZ8I{Och`%zQ~#iU4jLH)y>dLY16qhb
> z=3D0XQT=3DR@xwOZ`=3DPE42?Ag!YH(8&dx!VS9g*NSK=3D@bIW*Zd_f&r;Jx2Y;6L(L@5D0=
h
> zj|=3D$+!SD~`d_8F7LG=3DTB-l}{Ie&Y;`RG!$z-)-bB_@XP2nZdhL$2%Jd+;3!(@&Vqp
> z<kJLN5plOCGUoAJh*>>4EMhNT0&Nlc_`xTRKTKjA%m90Qq4MAa@KIQK<gLBvjLanE
> zk8|foc=3DECVUiG(#ah&P^Rs3cVKAAf?!W;gcqI^f>Igi()(<E%{`~&&Vcp*43<i;?@
> z3&H7xk8|K1TP7Hp=3D-FbaEc~L&cvm%}7GsO@apbFk|22PROmW{7e)dj4W=3D<_SOeV(c
> zqj%q6Ay=3D_Y_7S7O=3Dsb>b;+Cr8YZ=3D2=3D4Rbj|$m_iwPiz;!*ORkayY&p6ByP2*$i+E=
E
> zc4NyD+BjtDevhsB?3e1+gnjtu;1cGkQ>BO4C*JGVu%5oNo;|9(^|k03!7OeB)2XS7
> zN!?Y<NR6$fAHm%8E0|9=3Df~oIjM^AjDm`-2yq#wboz7P}L8?#;C`VJ;BP)w(<nDiY?
> ze0GuTU^ZrZT?F&6i|O<glYRvABHO`i%=3DRM@%%d)*(^pLT5zLEhNB72T|1pAj%*Ay2
> zib>zWB$qC-9n8jT|0#k=3D{;EHnzGBjkU|wW9n2p)~a|Dw!pqNfyG3iGzFS4C8(wOZh
> zBbb~K#dP|L896hYi;HXrvoYIGM=3D+^His|$flfI)Tm>1a&W@ENH_qCoQy|2NH+~2kI
> zBbX7}&u}*DenI9rYAJi__s}lv(L2%F%{Oy%&UT8sPHVv~<Sp~-bBY!H?zeZjb)-4x
> zE9EcLtb^2^X+|cGV|^oYk++t<@z>r?&F$oULuPZI!)x6NPvtEs)L3d;WeX#Jo`jB!
> zmlm-{QzL&}$h(Zbk3HYZfG?xYVPmAu>AT&*r>6PA)W1{g+QGdM<Jz{9`{zKE-CDyQ
> zoP&(oLM!A>_N_4TJof0jp>8AZH)?+oGIQ{KCHgHdbamRl-d)?fj{8E_5tH?-%a8QY
> z*Xg(S=3DGiyW4`Sb{IKC+v>spGgtFV#%R&@X;iFXxabMTY%_G53ww6H_}E~f7|)otD9
> z{GBw1w-s_fQ}^~^@AtFM*>FF)MBfXusbdy(+_90nS?3)dAD`v%$5|eqpXK@fJj>5?
> zd5v`?`akFS<1@YwHNSp~FBE54lwS{FN6Jd>w{GAQ^C#86yiwGD`rWO*s^pG6$=3DgBm
> zLt~+9n&LM{_P8rMo0zS{X20Lfg}2F-ughFN_5B&&9RLU4MQo^4zj%67V*jKlesUCF
> z6va=3DE;%9oizMrq;E{?%RyRpG0w^DWzQ}&CT70u&@_uTK&$eT6#&UU_qQ^}D|=3Df~8E
> z8FpwqqR;qm@_X|6exE_EsozVx;urE>--PPlwfNVE9r}&!_?LHu#zN0T=3D?rAa_2W^o
> zP#nMFur`eT&iSc9U(SzyYt$2~+1jT@sjog~T)(BmiEeB<Xl(Yep4jLcXWw|w2cF%U
> z^ZK{7f)2c&G&dgea`H2D0e=3DhcD%E>6dRzEj^_WM^vtDOU`ntECnf=3D|}{TvL=3Dy86`N
> zH$?H9qIlw^GS1ngPP~GhPCOoQYlg#16px)+OPuk!Q9QX(6d7L>#V?8CpK*ETO*q}H
> zYsa(k1vYDq98Vs%z(=3Dd83GY+avhZWk``C|;`kTj__(lJw^@n2Kg~}r{4ZD2Uxp4&Y
> z_{8BE*LU*4CH(eBzJ24-?>zd0N9#O##G^lY^e2!0?9r1RJ?+t7JldM?65lv#J#=3DaY
> zH4ggSy?hVq_eult_vmns&hY3Qk7hxeV2}HIZ7b)uR_Axvvtzb5XIpg*R=3D~3Czx!M6
> zKl|J70_V5k7BU|?tE!b~-|yphb-yifv9>gcx20)<EzO(R(jvu{*2b1VTU)N`V$1dX
> z{yZXNi+_wOA0KB+BC^RzwzN#Or6Y2Ey4!Ml(3Z)0w#=3DDf%k#y^gC7reGi1|}!E0^H
> zzalphtlY3IIW*Z}OM%!@Qeg92iY+^GZL!O3DQB*VaSIv<(3mUs#sa-;30tfQGR|0T
> x4(p&+i7maDD_}fKU$Je*g7D=3D+L#{Y**4IuP+Dn@BI~Rw4*#AL(FSjoE_y3g8*u($;
>
> literal 0
> HcmV?d00001
>
> --
> 2.43.0
>
