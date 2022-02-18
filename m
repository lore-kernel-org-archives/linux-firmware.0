Return-Path: <SRS0=o5SP=TB=narfation.org=sven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D055C433EF
	for <linux-firmware@archiver.kernel.org>; Fri, 18 Feb 2022 15:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5FBDBC340F0; Fri, 18 Feb 2022 15:01:03 +0000 (UTC)
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 98896C340EC
	for <linux-firmware@kernel.org>; Fri, 18 Feb 2022 15:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 98896C340EC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=narfation.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1645196451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vg8BVEugctsdqPwI+1xt+x/A1mHe6ZYp91WeLa54JYU=;
	b=eXFR0DSRaJbYjUOhzvEXlTL3CrZ2Fo3/Lv/bnaYmDnOKbq+uLpgAmaPpBfAZLyKXJcV9Ni
	A18Z00d7vI8XvLu2juOV0cIcqdNEeasvvS5W85Xjj/HZyzPwzd5TlP03MO+j+wbLRyDeFN
	EM3tgRm+H0wdyOAGCcg13NE+y2c7Gt4=
From: Sven Eckelmann <sven@narfation.org>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, ath11k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: Re: [PULL] ath11k firmware 20211223
Date: Fri, 18 Feb 2022 16:00:47 +0100
Message-ID: <4785910.v3KmxWAaZY@ripper>
In-Reply-To: <BYAPR02MB4567669033A210A78AC397E9927E9@BYAPR02MB4567.namprd02.prod.outlook.com>
References: <BYAPR02MB4567669033A210A78AC397E9927E9@BYAPR02MB4567.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1841571.kgKKsBDBsr"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1841571.kgKKsBDBsr
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, ath11k@lists.infradead.org, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: Re: [PULL] ath11k firmware 20211223
Date: Fri, 18 Feb 2022 16:00:47 +0100
Message-ID: <4785910.v3KmxWAaZY@ripper>
In-Reply-To: <BYAPR02MB4567669033A210A78AC397E9927E9@BYAPR02MB4567.namprd02.prod.outlook.com>
References: <BYAPR02MB4567669033A210A78AC397E9927E9@BYAPR02MB4567.namprd02.prod.outlook.com>

On Thursday, 23 December 2021 15:03:04 CET Kalle Valo wrote:
>  ath11k/QCN9074/hw1.0/Notice.txt  |  802 ++++++++++++++++++++
>  ath11k/QCN9074/hw1.0/amss.bin    |  Bin 0 -> 11897676 bytes
>  ath11k/QCN9074/hw1.0/m3.bin      |  Bin 0 -> 340108 bytes

This pull adds the firmware for QCN9074 but not the board-2.bin. As result, 
the initialization of the ath11k PHY will fail.

Kind regards,
	Sven
--nextPart1841571.kgKKsBDBsr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmIPtJ8ACgkQXYcKB8Em
e0Yz3A/9H7Gix3bMBn50gieAjVOm8JW0B2vM5dhPl2Ngaz0FT6ZiL2hLXlVaAZ8A
HDcsAgv7R2bTyhElm4sp8nd22kxI7HwspU7B4KcKRFgYqBFrCcVQAezU539d3src
Cto4gDAeOA16BgkgLP6ha2mLOttKg6hWsH0j5ye7G3NPVMl9RX95a4OfS9CXQqG5
oS5iYamhuMThcEE6oYsITf3Ayd+baTPUcbEWZJI1aPVQg1vIYOAEJP8hSsuPxLJL
2tM/4dxU1F2doCWmpBbA3H2yAjgyJwY7UNxABsyvo3kZ133QU2FBxUyQ3uooGOGK
+uSZ+UxoxGOn0BNcUQ5pxRlqva/bfcb5n57GLA4EkpkA4H8yftdFu5MMYVsACmFC
L71qk37kBSoqOAJwZtUj4/dvdmqzXRvmaUR+i9eF7oPyIx7NCU5r8duIhIbaQbX7
Pi/PULX3kRh1vV+laJ0E2fmJfFzApTczOGtJQs0i8nRCD87+XjI4bXV+/ueOD9ON
S96B8RQU6SGFGwwAmFESJ4fTHTUrhQPVLXzy9OMRrIGJU71Wbo9BefWxr+sjk55P
yQcOhcZreU7SGWSWcpvr6k6ZsqMZt4nG8YgxV0TUXGPL7KwGTFRBw3KRJvjvH7dt
QNCNMWh82LD9PD2FZGovpxH7jr+LuuYrxfUUeXjRVyc3vRHMQPI=
=VQAG
-----END PGP SIGNATURE-----

--nextPart1841571.kgKKsBDBsr--



