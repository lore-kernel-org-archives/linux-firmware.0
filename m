Return-Path: <SRS0=u61K=TJ=narfation.org=sven@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365B5C433EF
	for <linux-firmware@archiver.kernel.org>; Sat, 26 Feb 2022 16:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 010E8C340E9; Sat, 26 Feb 2022 16:59:24 +0000 (UTC)
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BE3A1C340E8;
	Sat, 26 Feb 2022 16:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BE3A1C340E8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=narfation.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1645894751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aPq4Bg1djp0vQcUxtOmioMxeqdr22zUIpHx6asNYff0=;
	b=GSRTz4zoqis2QjwP0xdpm17Y9Qe3euT+zeQ6lD1jeSogvzlYkS+b2Xgl6gbbPUPdwgiXef
	eGM6x7tRLyM4yV56cHg38U7Fq0kb9PwGNZvZxsUu5kIN9FxsEthU2/p0Zul32cnfOZd9I6
	dru1nqEQUxwJFIhDUkl26bThXdyDYWA=
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@kernel.org>, Josh Boyer <jwboyer@kernel.org>, ath10k@lists.infradead.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, ath10k@lists.infradead.org, Linux Wireless <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@qca.qualcomm.com>, Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH v2 1/5] ath10k: QCA4019 hw1.0: update board-2.bin
Date: Sat, 26 Feb 2022 17:59:09 +0100
Message-ID: <28878626.nLntd5uNke@ripper>
In-Reply-To: <fa37099b-4d5b-7265-888c-fae3f48f6e9a@gmail.com>
References: <2ce6ca92f529aca13984db205ed38fa0fa6d436f.1645645875.git.chunkeey@gmail.com> <87sfs5squm.fsf@kernel.org> <fa37099b-4d5b-7265-888c-fae3f48f6e9a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3589107.JqdcrgG4eF"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3589107.JqdcrgG4eF
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: Kalle Valo <kvalo@kernel.org>, Josh Boyer <jwboyer@kernel.org>, ath10k@lists.infradead.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, ath10k@lists.infradead.org, Linux Wireless <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@qca.qualcomm.com>, Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH v2 1/5] ath10k: QCA4019 hw1.0: update board-2.bin
Date: Sat, 26 Feb 2022 17:59:09 +0100
Message-ID: <28878626.nLntd5uNke@ripper>
In-Reply-To: <fa37099b-4d5b-7265-888c-fae3f48f6e9a@gmail.com>
References: <2ce6ca92f529aca13984db205ed38fa0fa6d436f.1645645875.git.chunkeey@gmail.com> <87sfs5squm.fsf@kernel.org> <fa37099b-4d5b-7265-888c-fae3f48f6e9a@gmail.com>

On Saturday, 26 February 2022 17:39:23 CET Christian Lamparter wrote:
> The current situation is: OpenWrt has those board files (as ~40 separate
> files) all lined up in:
> <https://github.com/openwrt/openwrt/tree/master/package/firmware/ipq-wifi>
> Once the board-2.bin in linux-firmware.git is updated and a new release is
> made, those files can simply be deleted.)

Minor remark about the OpenWrt part: Keep in mind that some of these files are 
newer than the ones in Kalle's repository because the " Update ... BDFs" mails 
were not yet processed. I haven't checked all of them but it seems to be at 
least the case for the PA1200 BDFs. [1]

Kind regards,
	Sven

[1] https://lore.kernel.org/all/2931430.FNKZsP7sFK@sven-l14/
--nextPart3589107.JqdcrgG4eF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmIaXF0ACgkQXYcKB8Em
e0ZG2xAAyvrGe6w9svqIbMmTDYl2J1+a6ba0e6ETC45G4xWjZfQRCrTLoXzlhlmu
9jcCnYWVkb1fNs/Zf3+FZFtyZnI+76A2bn2QnvIhTxYI05zYcnvQ4c2qeJFRQ+fl
a/osHJrBs2egvD2LE3jH/7Eb3FoeyJzfd/3UU7zbl3YOU+KrnnkjHGIuBuPMN9AS
2Tp9QbI4UPkLURRVScdMlXaeqk4HsY5zclDo+YF1bdV/MOVHk1bCyMwbzuH9YZq3
mZPnunxzORf4/J6/BaX9NLmPPWC2aZ25vOBVu+TBBxCeMcLwPEo2KQWOWCo6rOoJ
eCwbmDfpTQwNSH65pBk1JtIx032JHr6Qmiy1Rpr6ub+gglAmpE8gRB6o+oz0hrzL
nlvgUI3uNi8RpIiQDjXJXAZaFfSym/d1ZWGz9AqCzfQQxVRYK5K2i5Vr7CAQ70hQ
b2wEGyqiOPZpztRgOeswaJZQEjp6Ik6fUBNwzXYwL5DLkj+XMir28eex0YP4JxPJ
TvRkAyxmeWEwrgKMIAb9biyugOWqnN6Agzef53LIlMzeubxuvI1138sfy7ddba93
yKvkI/S+7eJM3wH0jVHIHoliKzmIReqE953Nli8vT8VJyaKgl2qjwld/B0KiS/tU
foAUAIjJDvIoBwhY8fbA74pLDjrkQ74fy92XhjG48xqBYP2wVns=
=VsSo
-----END PGP SIGNATURE-----

--nextPart3589107.JqdcrgG4eF--



