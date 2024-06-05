Return-Path: <SRS0=LRul=NH=kemnade.info=andreas@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11669C25B76
	for <linux-firmware@archiver.kernel.org>; Wed,  5 Jun 2024 15:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D2F4AC32782; Wed,  5 Jun 2024 15:47:22 +0000 (UTC)
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BFA81C2BD11
	for <linux-firmware@kernel.org>; Wed,  5 Jun 2024 15:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BFA81C2BD11
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sEsr7-008unp-1W;
	Wed, 05 Jun 2024 17:47:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=b1uuEFqsV4yZUwAinmuv1G2tbmvV1dC+QmMUPqGEwBk=; b=kGrUNuZceU0P2/h56uVH9LgLWO
	zqDvh72I1sKEk71zgFfI630VWOfdgC0289bIv367AhHp0j0SDnZDaAJSlMc4mAB9/aVrcuvgpZ1sq
	JHOKA1h0hTiaVEfnxc5KP/CvkKDYtHOm6Pvqz/RNQ77YtYlkereK0UryNxYU0ePW0VD0j3t7Foz+U
	a0et5nE3+jrtQAqaNwdpzbtcGGKH70VrfLbDS3BcjITYQafd3USWB7r6MJemY/hHo+NS1AD7XGRBX
	5f5vZALUil4dXedJX+jKA1YwHYhEjhIJiUmc3h0L+5muQEXo9F36r3g6RxmiDbfHX0VyADS8m6SYV
	gRuozKtQ==;
Received: from p200300c20737c200b1839a3e94ddce00.dip0.t-ipconnect.de ([2003:c2:737:c200:b183:9a3e:94dd:ce00] helo=akair)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sEsr2-002hqR-2N;
	Wed, 05 Jun 2024 17:47:14 +0200
Date: Wed, 5 Jun 2024 17:47:09 +0200
From: Andreas Kemnade <andreas@kemnade.info>
List-Id: <linux-firmware.lore.kernel.org>
To: =?UTF-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@protonmail.ch>,
 linux-firmware@kernel.org
Cc: briannorris@chromium.org, francesco@dolcini.it,
 linux-wireless@vger.kernel.org, lukas@wunner.de, yu-hao.lin@nxp.com
Subject: Re: mwifiex firmware mrvl/sd8987_uapsta.bin missing in the firmware
 git
Message-ID: <20240605174709.5043af8f@akair>
In-Reply-To: <_pNnwoI9WHlb2EY635KdIv6t_goU-ZYp9Vav31jkFOCf9fCE9EeKdyCea2m-L8pgfsKIQvODlnQLhQqmWSYip9e6FFZwaJHL5-u5rdOS_kY=@protonmail.ch>
References: <20240605160013.6bea8d4d@aktux>
	<_pNnwoI9WHlb2EY635KdIv6t_goU-ZYp9Vav31jkFOCf9fCE9EeKdyCea2m-L8pgfsKIQvODlnQLhQqmWSYip9e6FFZwaJHL5-u5rdOS_kY=@protonmail.ch>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Wed, 05 Jun 2024 14:43:53 +0000
schrieb Tam=C3=A1s Sz=C5=B1cs <tszucs@protonmail.ch>:

> Hi Andreas,
>=20
> Excellent point. Please note, that btmrvl_sdio needs an SDIO BT FW.
> So, mrvl/sd8987_uapsta.bin should preferably be a such a combo FW.
>=20
as said the firmware here seems to work for me (after renaming):
https://github.com/nxp-imx/imx-firmware/blob/lf-6.6.3_1.0.0/nxp/FwImage_898=
7/sdiouart8987_combo_v0.bin

I can use bluetooth together with btnxpuart driver and firmware
/lib/firmware/nxp/uartuart8987_bt.bin which is officially part of
linux-firmware and also in the same directory in the imx-firmware git
mentioned above.

> Unfortunately, to my knowledge, none is available publicly. Also,
> after the acquisition of Marvell IoT, NXP regrettably decided to
> develop mwifiex downstream, here https://github.com/nxp-imx/mwifiex.
>=20
> It is what it is. Due to licensing, the FW binary should come from
> NXP. I cannot arrange that.

Regarding license I found that snippet in nxp/SCR_nxp.txt:
Package:                   FwImage_8997, FwImage_8987, FwImage_8801,
FwImage_9098, FwImage_IW416, FwImage_IW612 Outgoing License:
LA_OPT_NXP_Software_License - Production Use, Section 2.3 applies
License File:              EULA.txt

Section 2.3 is:
2.3.        Additional Distribution License

But that is all legalese and I am not a lawyer... Best is of course
something officially added from NXP. No idea if it can be done
otherwise. How to make NXP add something?

Regards,
Andreas
