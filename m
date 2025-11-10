Return-Path: <SRS0=5JoC=5S=gmail.com=hkallweit1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75DECCFA1A
	for <linux-firmware@archiver.kernel.org>; Mon, 10 Nov 2025 07:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 60D25C19421; Mon, 10 Nov 2025 07:22:30 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DEE34C19423
	for <linux-firmware@kernel.org>; Mon, 10 Nov 2025 07:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DEE34C19423
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477442b1de0so17503675e9.1
        for <linux-firmware@kernel.org>; Sun, 09 Nov 2025 23:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762759347; x=1763364147; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SAMXxPyTLcmsG6wUi7QQl6T1C/rqf2+BKWG8fl4Cv1o=;
        b=daKP1DiI1EydgUPlqi94GhpiOg1keJjZRkjeVf9krEXLixbrd+skpzOWd2JyB8uN2B
         ddazlDBstOW1pIo0cnKABmXfZylNL8AEQRzstwJlxXA6v+JXro51GHVnwJapIQLDfBou
         CKRJCEwntTQPzXrUm6nQiXV/qccUpPf0YnttSMU4ygZPhXY5uQdnmqj741/i6rmT6dOG
         8u2iEzt1t1Jp7qZuyi8nXWocPNDgUadKvhnFGcivLGRlEVBvIQdHB15flYUcNuc+nYmS
         /W7kFLwrDlacS5J4P/ouaVRVbn2aFiD7bauSG0XRjsRCTpmbk9Ek1R4o0P2RQ/FBtNaa
         t6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762759347; x=1763364147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SAMXxPyTLcmsG6wUi7QQl6T1C/rqf2+BKWG8fl4Cv1o=;
        b=InI463FlNKTKFkC22PhiNxc9ttRFVSPSq2OgfU329FVOX4K5CcI7SDxYOAMVb7onod
         idWSAvz7u5MCZsVoy5Ad3KcK42Dhj7+By64mOsFgb/pczgTTuFAhCwAYGd6P2d29A8Jx
         V0l9va8W+XcRmw6lCJJjOWQRIM6hwNX2xv+llQ9NmlOMqFIbZaCLa2uVByF2fDByvIHH
         H+gCYXO4aqlEToBqe3E3Cd2QYSRf/6VXhnok1ChAsbtayzaSOH0YfHZzlEkk5x4CBHFd
         rO6lfxYWbLLrzfoVX50R+0tgXf4SRUP1b/pGiqGYpo26kXXQvWPsiABGVTkHYMI1+dej
         ZiOw==
X-Forwarded-Encrypted: i=1; AJvYcCXf1eGhKjK74HSb1bH2z5qhasbYfsuJdY7JqjIoBpXp5Q3+ypUIlrs5fxAKsOMYJk7s7iEdLVTqFFr6Q3Nb5g==@kernel.org
X-Gm-Message-State: AOJu0YwRX0Zkix1Y9cBn+TQ5Lkiu/hgBYwZYjAnXZ5zaiLeftjAEgCQa
	GkU2G5C9rPjkCBcCOHccTXwcerUovNIHtmroDEFH2YWwU27e+cRjuEuW
X-Gm-Gg: ASbGncumPUNuS1fxdc4BOyShYNj6luST0bB7pho3fvNVHEGzEDp0YlPVDeAySbbRQj0
	M8oLRhQ0rhy+pzABApxe8z6uWo2KHy4NGEhKkCfIlc9jYtYH8HaXFNhJ6KtmryIKcdZbg6h6Ppx
	X2AoZD9bgcTejNG0AGv0hpIPEojLsyYqRMQ6oJHm67bQms9Z+ETIpc/+2yeK4lXi+WJXB7nm0Rm
	l26QiaURUsY5dHXAbOfoXAgWcGuKyc7isfTeUUPxK1l1WnTC8S7WwSVqfpTeT+y70g6/B7mrAQN
	cXrkLjwcl6AnezHqAwSoopgbFZd1vo/2p7NdCmMa3CYC+QnPYSYQjSakp0iwsbnEYfG/S6Ei/np
	py4GTIYea9pYX+/oCnDPXh85MDg92F9QUU3ggeNPAo3A/ivTu3rcYDXWCZj0N7756JRM6OM4B0O
	enuanPiWiOd2H2w9s545khW9ojj/N7LRzlLz+fbZXsJpHDQWeVH0ZyBIpatnqRTtIonv2Gywgc0
	cT6hpwvt438lZzNhsqQCHnar825/S6kfD9bFGz+VCN6mjJty6xR7g==
X-Google-Smtp-Source: AGHT+IH1bwto0Y6FKvHe0tAO1BMEJ1pVNs3RqxoK5TqgNSGIG6/+UmRSsximQr6y7LfN2ekgpDXArg==
X-Received: by 2002:a05:600c:820d:b0:477:7991:5d1e with SMTP id 5b1f17b1804b1-47779915eb0mr29270295e9.25.1762759346817;
        Sun, 09 Nov 2025 23:22:26 -0800 (PST)
Received: from ?IPV6:2003:ea:8f33:1e00:3d07:b1e9:66c9:48cf? (p200300ea8f331e003d07b1e966c948cf.dip0.t-ipconnect.de. [2003:ea:8f33:1e00:3d07:b1e9:66c9:48cf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b330f6899sm8810215f8f.21.2025.11.09.23.22.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 23:22:26 -0800 (PST)
Message-ID: <a98d4f67-cefb-4060-8474-2a816efbaaf7@gmail.com>
Date: Mon, 10 Nov 2025 08:22:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtl_nic: add firmware rtl8125k-1
List-Id: <linux-firmware.lore.kernel.org>
To: javen <javen_xu@realsil.com.cn>, linux-firmware@kernel.org,
 nic_swsd@realtek.com, Chun-Hao Lin <hau@realtek.com>
References: <20251110065104.3163-1-javen_xu@realsil.com.cn>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20251110065104.3163-1-javen_xu@realsil.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/2025 7:51 AM, javen wrote:
> This adds firmware rtl8125k-1 for RTL8125K.
> 
> Signed-off-by: javen <javen_xu@realsil.com.cn>

Hi Javen,

are you working for Realtek? There should be an
approval from Realtek before applying this new
firmware version.

> ---
>  WHENCE                |   3 +++
>  rtl_nic/rtl8125k-1.fw | Bin 0 -> 8096 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100644 rtl_nic/rtl8125k-1.fw
> 
> diff --git a/WHENCE b/WHENCE
> index 9adbd42c..0bc967ba 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -3612,6 +3612,9 @@ Version: 0.0.7
>  File: rtl_nic/rtl8125d-2.fw
>  Version: 0.0.4
>  
> +File: rtl_nic/rtl8125k-1.fw
> +Version: 0.0.1
> +
>  File: rtl_nic/rtl8126a-2.fw
>  Version: 0.0.2
>  
> diff --git a/rtl_nic/rtl8125k-1.fw b/rtl_nic/rtl8125k-1.fw
> new file mode 100644
> index 0000000000000000000000000000000000000000..8572cd689f55912d7a1f422af4ea9b51ad87eb15
> GIT binary patch
> literal 8096
> zcmbW54Qy7`8OQJY_Ui>IeSte#Dx;SV0o}AMQz=f@7sZw697N4%aHB0P6embQSj#YS
> zs8T8lZ8WBpEu(C*GDX@YC{-4V#*fYqQa9(vmTYc`Su!(ivgp{<bie04&%IpkS}m%_
> z|M{QiInQ}M&N=t=bsWdpyk&h^>4M8{ySTKf<dTw0O1;w3;*!gY7hHx+{%N2M<T%bd
> zfu^^irq-*uz0PY`x6Rv7yVYBJ>*fuOHJjIX4K-V8*Lk%Y>(+RsmtRp*cEx3joV}0C
> z5i?oxznJ5sp35sTjx(Q@ppB>H(k9Z9w8=D=HkDRDE2K@Q&7gU-S+qH{xhBJL-gTU8
> zW777VRPzL}o8;g0e<w|vI}NOfUeZZnAmzln>KvyXcS^1qUu0&RDJE9tnoIgX$2DT3
> z9X~`iwQCCYTr*kG6)bQ~(%>JsPw`E~zwNZ+S<M#bjf8)2&EDr-lL=<*bxrIo*Ib)&
> zP5f~?mJPq~0@uvMW&!=})voy?@@Ye^*?+BT%0U@Fv6{IjT(gRPDgB{b{G!FM8$0Ei
> zT*fPETx0HWO^W8xl8@jQvMhA+&`l&*7kfjDUkSz|_Po!t$DAZK!}c;m_U2<RGh#0_
> znmuf#{fpR(hwQo7OGNCMk?dhBh&N&{7P2RPJLJJhx@J$I#S5wFx5(QTaxOW(xXO+n
> zm%5Imx5JK~8bL1eH^_W!R!_Bc`t>?n;~B`duXWAJI@c@;)h=9@a2;R5A44obT*SD5
> zd`R6&1j&Qc%AYTF7<E2#q;9ixzNho0HvW9c`-t<I>(^<r&QI!msf9mZ^8A1EnH%`e
> z`u@I?{M=7|q!#|(f7hJ7_w!hz@EXnpm_8Hi>u@~^&$r|I$dlCXQt~cw-9-B$z1is0
> zk3nxPI@`yfcOg1$su$ij;@7be_KU=G6o2Ksh_B}|XVI6KbKRGia|?5(;peo)cK^nX
> zP~W4rX5w=b=V!d?6sXQ5(b2oezjwmtP2%n)ZrL+pds~V->9A{lfSu0kIqURSM%Imw
> zVcl7wbv^c6^qh~juH36{R}dfT%3T<aH**Z@E(xuhI)`=BdwL1yfpup@)=i9I-PX{$
> z<{Z||V694W9%EfOgO}&qvm^CrEpg3B?zG=?&NkB~(Rw*s=P{>qfoontCiRvYB|ynp
> zHYhP<f?`w7x70IT^MtMQD(XCm`%dn^pJ20)_Aqw+Z_zlJlZy@X#h&!#E)rj*FZYUX
> zF9#co7u!2yGMELI?_}&ZoTWk6Jo~zhYiK89KjrK)_5x$cXRt?%iG$Xs4CL}Hj(5?1
> z;To}9gB{U{-DlU^^StHbUL|L*G2WwokhkwlvGH^;r-?NlWexGy?~A>I$mDL@42qwH
> z<UshEYS-M0P07`Lpq!<F307zDBG-Ji+1irvQ;Z9~q4;0&al@c%Ueq}I@MA9Tli^|4
> z%u$@B=z$L+&jw4uOz<)8+&EY(cQ2R#6QEP%p7riIo#PsL_r&n;V-H<t<aXo1DQ0@y
> zH8+FKOxJu594;qciYpbrueeIFT5&m;fo*wnCBf0&TzHe-uU9Evr}$mP8x<c=>;i|M
> z<J+^}&b!(H$>V$Y>OF1y$LPyDEMqYoT+h8EI&+xo>AX8+9`(Kl6kXXPdCZsnUQJ*0
> zFE;Eiu_^l$ofFlrnO>uNx6q!MPZ>+^Yq-D1GwJ(#JV9UPi%w=1HR4?;-;R%Ujg$B)
> zwvU8-6u%b5cpL8LEg*Xq{ulIwCm*)_Ex6c<?RCu#9k1?0_6lRN*Le>O?Sj*nwX;~;
> z>w}-9J<FMT5qt@~0rvZELB^-y(`m-zjE`eH#duuDB_FS<uif~X6g#1@F2=mb*g?i*
> z?QGUgvG&W@j;U=Yv}T|B;;^QSCq`KF5Vj2Q#EDn((MEp4>(8MslGm;1Nj|?Wh<|>~
> zKN`04`W)+120lst2G&_UzYa^`H&nak6ZFMiGkvjhkl6F~oUJS0d6E5D@&fucdKj0w
> z<Vo#9<CWY2FBsR{0=@>`^flMK1O8ilL+>KBBYQdZv>p45e!<Y_a(~T7)fdsvjp)l*
> z*pJ6lH@uE-r<Hg=6@SRFCpiXZf%`bee{y)+fycl-;7Z0@!8ftr0!kk40T(jf3~oZt
> zfQ!L)a2S;Pzyn9S52hKr=Fb$LQhZf$`c5mKtyl~eQ72Q)_k+9hnn8Q^V)Rq=#s7iv
> z$nT}z=*_L+9D=ne%d43u<Bg!aqvh_F_f1^>o=Cdp$CF&M^ELc^!}1H@&G3mKem7in
> zS0WQ%j*(xn`R(;1uhnrIzVU6!=4`}c?3K`3sh>0UE9QZQR)=2vG5U9N-*oY}W@s(>
> z<~+e#-cynFcQ7XRM93%kHf_1n?(6hD5Rx4d{Z5UWJb4FMPu30jWturl>WlbMK;Fw+
> zu(zANflm*T?~1`QYs%VH<U`Klc6^jre1CkI_}_#qDKh$Z<D=9~?8yCDP5=7Ou{n~x
> zZP@eh&Es!Nsr`NAI79OM6?|x;|BxNOGBlp}r5%sz$v%0YhPmL>#ndE}4_`MGvU$~n
> zGi#-IQ}}BwW&B)i-8y+>TU$co;<w!4vd+yR-`dG%rq)XGx}3abvWLouIg#y}36I*C
> z{21h}N*#60k`#H{XYKhi?|zK~J5AUTd;7t0)Mks;N%~tub&^<bTzw{QVc&eae%@p+
> ziT>ZouP<vjWY?58sXylDbG$h-*1-2bVwd^<!Y4U<AAsWHGq>0}Z<=WFPQ|-G-=@(T
> zt(G&zUilq$68j}$SNBYk+@$M>P06E2?y@<HqW>g1S;U^cXOeuA&SM<C6YN2Meu6WS
> zp09H8^~oJ)<U^bvk++^=E;@4G1aoy?%6I4xYs*`6Q_8NrM%KcIjo?JyT9sff_yj(U
> z2VW<a1h|lRv%z}yO(ytF#^c}|^c?U-?#3h-y_-)L*>|GjpyxMY4f;A($K3a^wHCaC
> zwblv8mmh+)jIRgf-FUlVgW_hz)nFdB?&SBne)4`7xQn{<5bG!K7U`3hGV+-2S8zW>
> z`n&px=``;k_FRqhITO;)J?a`?_M?zY`nx_LmaAQJKK8#co9`BPev8Z{A2K)HCl2Y0
> z&MdwSqH|;|ZzSUU@Du#o#+~x6YaZvVorewI=8_^i|E&^gKx}n!-mIL*jt}j(byp^S
> z;%^Inwy@q`S?B#W?!Wiwd#?G1_IqZ!rkiuIikxKen@Ba-1g-|<U0DYnK;8n%-wCaX
> zdlc_iECVIS@>^(9e+zXS`&+2}jWs|0`>6bOD)pTKx~lJ>@Ba?_;jrVuzwmchUq6ZR
> zSoGz$*_V$@F_|&mn4n|$`v{bn1_kphulVe29>{a7d?Wc2{gc=^Yre`m{%Pd{qsaR|
> zvhqQd=TPJH`Z_;P`P(Yr-DTxQd7kowKmV|mJIdRXw<@34YvuCJ5`T-8&sSd2XXPp7
> z%akuwo*(hAD8lpApQP#+DKAjIQ2i-UUaq`Md58MbuDnWlrScW(&vNAlly@qh7xAY!
> z!grfU{*(v#YmMYjd62*MNdA-u`Rk12Pr0AJZp}xR`rD)NA68zk@*3qERer1Tg^_s5
> zBRpT@3G%Nz$iK!D<X?G^e~l-|zw#je8c&da<$nH;_uBY-)!+U;%lni!s(h339V*|Z
> zydo0MvIyT@ZS5J=&r_aIp0m!%9p!DxTb0jiuyRj%vGV!KE1Il4rF@z4rOLZCpIyp(
> zG=GPc*Q-3JpUVCEt%$@^72)|BPg3m_DKAjIP~$04Uaq`Md56Z+uDnWlrScUT&vNAl
> zly@pW-frXXRo>red7tt|l?U}xxnIBfNIV-Oe0R#)GionSc|v*4QY&|qw<&K`K5w~|
> zd&-NI&sSbiY2_*9%akuw-mUrUQr@HaJFL83<w5;a?$@s|63>nZ&)0a8YOhFnf%1hK
> zPl@t!<z>n{G@f?lRmv-suh4jwD?gyTQ~B`*8-K6z{wB-&lsBq8sGrLH`t6Ry(-z^~
> z8c&cv^*_j;%7gr=+|OS}#NL4jKd$ix{%d@J|0)msSGn(hcf?*#gx7mEAAx`KE%*I9
> z9?|cQ@Wv9WAFN+yxxfB@{P#n?{l12I`n}=sdn?~vd7}-0&PheMzG2euB6$y8dS=WS
> N>pLjLyT*z9^FM{_!IuC4
> 
> literal 0
> HcmV?d00001
> 

