Return-Path: <SRS0=aG5v=JQ=cknow.org=didi.debian@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7FEC4829B
	for <linux-firmware@archiver.kernel.org>; Wed,  7 Feb 2024 14:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 59AA7C43394; Wed,  7 Feb 2024 14:48:37 +0000 (UTC)
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E7D84C43390
	for <linux-firmware@kernel.org>; Wed,  7 Feb 2024 14:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E7D84C43390
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cknow.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1707317311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=cTOI5iXklLvT0d+cIXklXU2DQWWeQXKDwnRcOLnVhbU=;
	b=QwG4fjOkjTLyG2mbs+KhJ5G//NXllGLgCQ/GiWswkYEKVZlSXsV9t8F+sOivXMKHeSyuew
	6+jplX835WFQsRlVWQ4pyNHOnLiuVxdrfq1COJrokqoGjYeCXz+PSjmVjDJriCC+/yYIrk
	G+nVPBzC+qS42qSIsRocUVNz+Rb6PokA9oimKaUuLogeHcfCgbe8RWGmOsSemAEFnT9xDl
	W634XyhvMJcPO55IJOF/giLJOxK46Na+G4hq7XzzMhmtbJ8yCntAebEWt6nnraLU86r3d5
	JeNG0wCwfETAhd/Ck+b36ORyUoch1fV2yKyT5ASiSZp5C81x43CNBPSs2ScExw==
From: Diederik de Haas <didi.debian@cknow.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: License and copyright on 'native' files?
Date: Wed, 07 Feb 2024 15:48:20 +0100
Message-ID: <2958104.rSODG2ex0Y@bagend>
Organization: Connecting Knowledge
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2873708.AJmqK9VhC1";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Migadu-Flow: FLOW_OUT

--nextPart2873708.AJmqK9VhC1
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Diederik de Haas <didi.debian@cknow.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: License and copyright on 'native' files?
Date: Wed, 07 Feb 2024 15:48:20 +0100
Message-ID: <2958104.rSODG2ex0Y@bagend>
Organization: Connecting Knowledge
MIME-Version: 1.0

Hi,

Lintian reported several file-without-copyright-information wrt the repo's 
'native' files, like Makefile, README, WHENCE and that'll likely also apply to 
Dockerfile and the various dotfiles.

The Gitlab repo indicates it's Apache 2.0, but I'm not sure whether that is 
correct or that gitlab assumed it was due to some heuristics.
The README.md does mention "in a GPL'd work", but I'm guessing that refers to 
the GPL-2.0 of the kernel itself.

I saw that 'copy-firmware.sh' is licensed under GPL-2.0, but the other files I 
checked didn't indicate the license of those files. And none (?) seem to have a 
copyright statement.

Can the license and copyright (situation) be clarified?

Regards,
  Diederik
--nextPart2873708.AJmqK9VhC1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZcOYNAAKCRDXblvOeH7b
bjsvAP4scQfvE0FSv5+5hU7+FcOzycwO92adObHQBOSSNNFW6wD+JNuz9hW30k3U
QF6YJ8R6nasbVcDGNUh7t4M59nGTdwg=
=XcAd
-----END PGP SIGNATURE-----

--nextPart2873708.AJmqK9VhC1--



