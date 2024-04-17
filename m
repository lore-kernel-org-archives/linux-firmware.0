Return-Path: <SRS0=otPU=LW=sipsolutions.net=johannes@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED36C4345F
	for <linux-firmware@archiver.kernel.org>; Wed, 17 Apr 2024 14:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 48DF6C116B1; Wed, 17 Apr 2024 14:11:47 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 957B1C072AA;
	Wed, 17 Apr 2024 14:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 957B1C072AA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=ytE3RuR82kzReb6CQQ2/uk3bZZIXA92Udt32eR1wCG4=;
	t=1713363106; x=1714572706; b=t4H/yDG7KOjYKViy5Yyn+r9b6yMv/Gd2h7QOzCMKfJgGe9y
	x7hM9gV2iHNKB+IQdLmpf1GBtyG/HsHMQxmm8ljkPz3AE0ZyxCd1k3+WCVfsubySgNSsO2654aWfU
	URdVNRWtxS+aMOJqdxqv4yUfSXTCQYFn8FpTSnY+UR1Gk8clwqydwIyxLQbgV7baMfedD2LZPp8lv
	msEbaFgUs58rhnk2VogIdJguVb/mGhFmc/drrzcs04BHVYreo/i/Xef14Q4vhjliQ461LhDyFXKrk
	tC4mS7dRHwDcUDONLepeh8JnHZqNwQKeFeiy1PLK+qlZttb3N5T4+020TDdENhuw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rx60l-0000000B0SI-1BlL;
	Wed, 17 Apr 2024 16:11:43 +0200
Message-ID: <4e07bb9f498566ed89e7e967e12f01821801acc8.camel@sipsolutions.net>
Subject: Re: putting future iwlwifi firmware into intel/ ?
From: Johannes Berg <johannes@sipsolutions.net>
To: Kalle Valo <kvalo@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	miriam.rachel.korenblit@intel.com
Date: Wed, 17 Apr 2024 16:11:42 +0200
In-Reply-To: <87v84gi1v4.fsf@kernel.org>
References: 
	<fec30176f437d565d4c1dfc4944373f117d75a64.camel@sipsolutions.net>
	 <87v84gi1v4.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Wed, 2024-04-17 at 15:56 +0300, Kalle Valo wrote:
>=20
> Yes, please. It would be nice to cleanup linux-firmware.git top level
> directory. But what about this:
>=20
> * convert iwlwifi to first use _all_ files under intel/ and then as a
>   fallback top level directory

Yeah, that's quite annoying though since we currently look for something
like "iwlwifi-<hw>-<version>.ucode", and version will go down from some
number to another number (e.g. 73 ... 43.) So now we have to double that
loop up and try intel/...-73, ...-73, intel/...-72, ...-72, etc.?

johannes
