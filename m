Return-Path: <SRS0=6kO6=KO=cknow.org=didi.debian@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F98C54E5C
	for <linux-firmware@archiver.kernel.org>; Fri,  8 Mar 2024 11:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B17FBC43390; Fri,  8 Mar 2024 11:18:05 +0000 (UTC)
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com [91.218.175.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 45061C433B1
	for <linux-firmware@kernel.org>; Fri,  8 Mar 2024 11:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 45061C433B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cknow.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1709896678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=60qdvcTJ9+OyhILLp+mFZGUNNcEy1lvXKW3d4AQlGrA=;
	b=PTmCoYK6EV8xDbFPAkuKQZ5keDIInzcG0CwqDkmRMYwGbCf0dlKTj6EA5kbG4DPM/gPQgl
	zTzJvcOS+nIi0i373husnKnEsKpXlLxJ+ZWRJ494bvoERghzUni/LtBnLVxLRzHX4X+oQk
	W8ovqXnDqIu5EOOws4I/uL+mwHhUH5M1MUv5ja8SfIC2FUIjUep5oXRVSe05b5FgXc81pi
	SVlj8FjOdtQlwkRE8Rb6kxNC9Wcfh9xcveMrmkVhY82Djw5sfHAt4bStVQWbt8dsOylbYa
	oQXLoIfIEwOuZ587YbvyYHTA29FlD9Ot6GX9DM7v498dU7mGiz+i7KxlB1TdPQ==
From: Diederik de Haas <didi.debian@cknow.org>
To: Josh Boyer <jwboyer@kernel.org>, Shayne Chen <shayne.chen@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 linux-firmware <linux-firmware@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Shayne Chen <shayne.chen@mediatek.com>
Subject: Re: [PATCH] linux-firmware: add firmware for MT7996
Date: Fri, 08 Mar 2024 12:17:41 +0100
Message-ID: <1830271.9lIaUe8Gx3@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20240122062445.7989-1-shayne.chen@mediatek.com>
References: <20240122062445.7989-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart26315397.hknfd3Z3zq";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Migadu-Flow: FLOW_OUT

--nextPart26315397.hknfd3Z3zq
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH] linux-firmware: add firmware for MT7996
Date: Fri, 08 Mar 2024 12:17:41 +0100
Message-ID: <1830271.9lIaUe8Gx3@bagend>
Organization: Connecting Knowledge
In-Reply-To: <20240122062445.7989-1-shayne.chen@mediatek.com>
References: <20240122062445.7989-1-shayne.chen@mediatek.com>
MIME-Version: 1.0

On Monday, 22 January 2024 07:24:45 CET Shayne Chen wrote:
> This patch adds firmware files for MT7996 WiFi devices.
> 
> File: mediatek/mt7996/mt7996_wm.bin
> Version: 20240104161608
> File: mediatek/mt7996/mt7996_wa.bin
> Version: 20240104161505
> File: mediatek/mt7996/mt7996_rom_patch.bin
> Version: 20240104161614a
> File: mediatek/mt7996/mt7996_dsp.bin
> Version: 20231113135337
> File: mediatek/mt7996/mt7996_eeprom.bin
> Version: 20230518
> 
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> ---
>  WHENCE                               |  15 +++++++++++++++
>  mediatek/mt7996/mt7996_dsp.bin       | Bin 0 -> 191640 bytes
>  mediatek/mt7996/mt7996_eeprom.bin    | Bin 0 -> 7680 bytes
>  mediatek/mt7996/mt7996_rom_patch.bin | Bin 0 -> 22816 bytes
>  mediatek/mt7996/mt7996_wa.bin        | Bin 0 -> 515504 bytes
>  mediatek/mt7996/mt7996_wm.bin        | Bin 0 -> 2572400 bytes
>  6 files changed, 15 insertions(+)
>  create mode 100644 mediatek/mt7996/mt7996_dsp.bin
>  create mode 100644 mediatek/mt7996/mt7996_eeprom.bin
>  create mode 100644 mediatek/mt7996/mt7996_rom_patch.bin
>  create mode 100644 mediatek/mt7996/mt7996_wa.bin
>  create mode 100644 mediatek/mt7996/mt7996_wm.bin
> 
> diff --git a/WHENCE b/WHENCE
> index 9db8b41f..81ee6d95 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -5663,6 +5663,21 @@ Version: 20230728
> 
>  Licence: Redistributable. See LICENCE.mediatek for details.
> 
> +--------------------------------------------------------------------------
> +
> +Driver: mt7996e - MediaTek Wireless MACs for MT7996
> +
> +File: mediatek/mt7996/mt7996_wm.bin
> +Version: 20240104161608
> +File: mediatek/mt7996/mt7996_wa.bin
> +Version: 20240104161505
> +File: mediatek/mt7996/mt7996_rom_patch.bin
> +Version: 20240104161614a
> +File: mediatek/mt7996/mt7996_dsp.bin
> +Version: 20231113135337
> +File: mediatek/mt7996/mt7996_eeprom.bin
> +Version: 20230518
> +
>  --------------------------------------------------------------------------
>  Driver: nfp - Netronome Flow Processor
> 

This block in ``WHENCE`` is missing a Licence/Redistribution statement/line.
Could you add it?

Cheers,
  Diederik
--nextPart26315397.hknfd3Z3zq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZerz1QAKCRDXblvOeH7b
bqjnAP0Q4raCP9nidwlc0bmfv9Op30Rh6W46FoomSzOsb27ZSwEA7ekm8H2igXmF
BUIHc2yJ0ximzGxkAgJBXDBFDsKboAg=
=r9Mw
-----END PGP SIGNATURE-----

--nextPart26315397.hknfd3Z3zq--



