Return-Path: <SRS0=QOMH=OZ=sipsolutions.net=johannes@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9CBC3DA49
	for <linux-firmware@archiver.kernel.org>; Thu, 25 Jul 2024 20:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 58FBFC116B1; Thu, 25 Jul 2024 20:46:43 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6B1A3C32786;
	Thu, 25 Jul 2024 20:46:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6B1A3C32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=Phw4NttKMMcf/h3rDAaLPFPthPuilYGOaVPYPZvU0l4=;
	t=1721940400; x=1723150000; b=KFDyVYQ1NMGnoDolLrBvWyNaZJ+ES/xvSJqSQwyhrkSRBPE
	feCCd69x0h8/xaecIG6fqBuXZgMjSrw/OxUAhSzkX0pmuwBm8PgEid/p0Jgguu4n0VUJnfLYxWCLX
	tZGSWidoZxCtGKJSxvGR/w8aNx9EGtf56Bm0tCRUT5zgQdrF/6f4GOa/CHri9O8lASAYiAEIhp1ZR
	9ZH7Zgj9brKX5eCGsqG7fNYoyNBdKOiUrtrcF2YwTIMdrPsSRTFrpy2SuwEvs9NCHH3ehqVTAnHYO
	y5QfMjAth3IIP+ZDNJEW4dJxM6zTItrNR+bWumRTx9gwBnrlbkUlcHCJYfzWAvrg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1sX5MC-0000000H326-1syE;
	Thu, 25 Jul 2024 22:46:36 +0200
Message-ID: <92696aa1704e43897cbed421136845745e023127.camel@sipsolutions.net>
Subject: Re: pull request: iwlwifi firmware updates 2024-07-25
From: Johannes Berg <johannes@sipsolutions.net>
To: Josh Boyer <jwboyer@kernel.org>, "Korenblit, Miriam Rachel"
	 <miriam.rachel.korenblit@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
 "kyle@infradead.org" <kyle@infradead.org>, "Hutchings, Ben"
 <ben@decadent.org.uk>, "Ben Ami, Golan" <golan.ben.ami@intel.com>, "Yang,
 You-Sheng" <vicamo.yang@canonical.com>,  Wireless
 <linux-wireless@vger.kernel.org>
Date: Thu, 25 Jul 2024 22:46:35 +0200
In-Reply-To: <CA+5PVA6zGFMsV16BhmbB9QnZQ9UsUw1-44MK6gOc84MnhroDXA@mail.gmail.com>
References: 
	<MW5PR11MB581002D586D332CACEB335BAA3AB2@MW5PR11MB5810.namprd11.prod.outlook.com>
	 <CA+5PVA6zGFMsV16BhmbB9QnZQ9UsUw1-44MK6gOc84MnhroDXA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Thu, 2024-07-25 at 16:03 -0400, Josh Boyer wrote:
> >=20
> >   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware=
.git tags/iwlwifi-fw-2024-07
>=20
> git fetch https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-f=
irmware.git
> tags/iwlwifi-fw-2024-07
> fatal: couldn't find remote ref tags/iwlwifi-fw-2024-07
>=20
> Did you forget to push the tag out?
>=20

That's ... curious :)

Seems like the day ("-25") got cut off at the end, we've always used
dated tags here, and there is one from today around the time Miri and I
were discussing this issue, named "iwlwifi-fw-2024-07-25", which also
matches the subject. No idea how it got cut off in the email though.

johannes
