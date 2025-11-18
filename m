Return-Path: <SRS0=hBoP=52=realtek.com=hau@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6DECCD19A
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Nov 2025 05:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3BBBDC2BC87; Tue, 18 Nov 2025 05:49:55 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EFCA4C2BCB1
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 05:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EFCA4C2BCB1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5AI5nd153912499, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1763444979; bh=Gt/5LkMPCSLi83Lr1DPZ2KLfwZO+x7ztGCtHg9MBj0I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=RnvYhYXGWd5clk0JzFU8MzIQgDaU3ru+tdFBBBhQxyNGE3yIsOVRPp2KSJNO7Vunp
	 YzxIQ9Nd6zfEYfKm1jbuPxKBQZ+JG4y2YlxbVIA2sUgf/TLrgc0V17R6CscNasRK6s
	 4/gEbCi5ksWkQ5fXXueOeupRQBGD8Yz3FmWnFEB43utqVBzx7rVFL1F9iMLSZMp59i
	 P2NVRdYy03u455KkMq5YJ+xPBGKHvvZbAv7T6LNjIkGIQ7jjbkzx8kKgZCFBy3ZG1K
	 7X5EWiIoPqf0LfOEXzBSYFGo3evfVRCJcIAl7fcnpKy/BT62iJSJCSP+/1vUs96xe6
	 4Bj6mz2XusRcA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5AI5nd153912499
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Nov 2025 13:49:39 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Tue, 18 Nov 2025 13:49:39 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::744:4bc9:832c:9b7e%10]) with mapi id
 15.02.1544.027; Tue, 18 Nov 2025 13:49:38 +0800
From: Hau <hau@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "javen_xu@realsil.com.cn" <javen_xu@realsil.com.cn>,
        "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
        nic_swsd
	<nic_swsd@realtek.com>
CC: "javen_xu@realsil.com.cn" <javen_xu@realsil.com.cn>
Subject: RE: [PATCH] rtl_nic: add firmware rtl9151a-1
Thread-Topic: [PATCH] rtl_nic: add firmware rtl9151a-1
Thread-Index: AQHcWDQUJiyOPEEgL0qdwx4RwuWu6LT37ZDA
Date: Tue, 18 Nov 2025 05:49:38 +0000
Message-ID: <e362812eb2134b3fa3d0ffd3903c57f1@realtek.com>
References: <20251118023557.3424-1-javen_xu@realsil.com.cn>
In-Reply-To: <20251118023557.3424-1-javen_xu@realsil.com.cn>
Accept-Language: zh-TW, en-US
Content-Language: en-US
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0



> -----Original Message-----
> From: javen [mailto:javen_xu@realsil.com.cn]
> Sent: Tuesday, November 18, 2025 10:36 AM
> To: linux-firmware@kernel.org; hkallweit1@gmail.com; nic_swsd
> <nic_swsd@realtek.com>
> Cc: javen_xu@realsil.com.cn
> Subject: [PATCH] rtl_nic: add firmware rtl9151a-1
>=20
> This adds firmware rtl9151a-1 for RTL9151A.
>=20
> Signed-off-by: javen <javen_xu@realsil.com.cn>

Reviewed-by: ChunHao Lin <hau@realtek.com>
> ---
>  WHENCE                |   3 +++
>  rtl_nic/rtl9151a-1.fw | Bin 0 -> 640 bytes
>  2 files changed, 3 insertions(+)
>  create mode 100644 rtl_nic/rtl9151a-1.fw
>=20
> diff --git a/WHENCE b/WHENCE
> index b2a73d16..46f3345d 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -3615,6 +3615,9 @@ Version: 0.0.4
>  File: rtl_nic/rtl8125k-1.fw
>  Version: 0.0.1
>=20
> +File: rtl_nic/rtl9151a-1.fw
> +Version: 0.0.1
> +
>  File: rtl_nic/rtl8126a-2.fw
>  Version: 0.0.2
>=20
> diff --git a/rtl_nic/rtl9151a-1.fw b/rtl_nic/rtl9151a-1.fw new file mode =
100644
> index
> 0000000000000000000000000000000000000000..f2eb2c4219b7ebeb6ccdfd44c
> 7bbde90687c2f33
> GIT binary patch
> literal 640
> zcmb7=3DO-
> lk%6o!u<nM`7Xb5M!UOGUUz9mynD1Jw`c7s#N7L6(Ra?GEl*1TKpf*~hMJ
> zi=3Da)oX<Mtd{eymjy>}dH8QqzOhkNJDnKLgDQMY%nX_swx&8`*m#k{R-
> yI@xer81uB
> z)d2$#{HavkW<T$$wp&;3VMBFVr>b2)R(t#1_KDkVs*c;Mw^aS8(NuP&THdIx
> m+1UT
> z_X-
> d><N2%*<v<h|AO_;V1PQ<(3DRHzEP@PBU<s^%RS6M&5=3DBJ3e&h`1bYByfcf
> W|Y
> zrw+b}I+GkUa40xx5DkfDid#ljmc<g<WywET5+D}cV~9EQv*gGUg|h^#XJYL%iz
> %27
> zPWjIL!+|rF*$<Y!GwpF{O??d;BbG>vB^Y3FZdrz4`wsgDmhe5x>pRQN8|qD#S
> ^`F&
> z=3DNgMbjh<(WcjGsfOeQQb--
> hp~?}+cP?;!k$_Xxhg3?>|+X%0vd|DE!(@N)9ck)?N*
> Uk>6UK@7IJB{AcbCvL%0g0|KF(0RR91
>=20
> literal 0
> HcmV?d00001
>=20
> --
> 2.43.0

