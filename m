Return-Path: <kvalo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA16C4345F
	for <linux-firmware@archiver.kernel.org>; Wed, 17 Apr 2024 12:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 106A1C3277B; Wed, 17 Apr 2024 12:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8877C072AA;
	Wed, 17 Apr 2024 12:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713358609;
	bh=bEePnxse+2I8XzUO+l8wK/LeFQ1L2SJAzaYTvMp6hCg=;
	h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
	b=d7wRYvHPWdssaEVt/RjNMmvXBCB4Mt/2JPVFM1viY/vgtr5DrgQbsMXQXPauXeujk
	 7g9ftrmY/v04m7f030FW7JzWPHyC0/RaswZksWQVNIRsvqrA0seZnvbZTpv2A0PSt9
	 zOXmlzX4n1YYSNt7oV7gFqWF67+8pCiI1WGIBZXTbQHK9465m/gfXMIX/qBVLIdmVl
	 GErCwclEODEVUdL9CT190AViFnuMn2nw8sx4TMTY/lNsAWGM+LI3td9dmoU0Cb7vQl
	 8pQBa1cmqqO2/7OfgNi62s5UooFeVCXruloH3LXRt7795yjm4y7OvK6iDEXy8fcSTY
	 FPwUzq/MAaqvg==
From: Kalle Valo <kvalo@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,  linux-wireless@vger.kernel.org,
  miriam.rachel.korenblit@intel.com
Subject: Re: putting future iwlwifi firmware into intel/ ?
References: <fec30176f437d565d4c1dfc4944373f117d75a64.camel@sipsolutions.net>
Date: Wed, 17 Apr 2024 15:56:47 +0300
In-Reply-To: <fec30176f437d565d4c1dfc4944373f117d75a64.camel@sipsolutions.net>
	(Johannes Berg's message of "Wed, 17 Apr 2024 13:18:03 +0200")
Message-ID: <87v84gi1v4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain

Johannes Berg <johannes@sipsolutions.net> writes:

> Since I was just looking at some firmware related thing (files for the
> hardware that might be shared between Intel BT and WiFi), I noticed that
> just over 30% of the files/dirs in the top-level firmware tree are
> iwlwifi-* files.
>
> While we can't move the files that older drivers might consume, we could
> e.g. change the driver to look up future versions/future hardware under
> intel/ instead? Would that be worth doing?

Yes, please. It would be nice to cleanup linux-firmware.git top level
directory. But what about this:

* convert iwlwifi to first use _all_ files under intel/ and then as a
  fallback top level directory

* move existing iwlwifi firmware files to intel/ but create symlinks from
  the old location to the new one (using 'Link:' in WHENCE)

* add new files only to intel/ directory

* after few (4?) years remove the symlinks from linux-firmware and the
  fallback from iwlwifi

This should ensure backwards compatibility, right?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
