Return-Path: <SRS0=otPU=LW=sipsolutions.net=johannes@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFDFC4345F
	for <linux-firmware@archiver.kernel.org>; Wed, 17 Apr 2024 11:18:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0372FC2BD10; Wed, 17 Apr 2024 11:18:08 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3BBB6C072AA
	for <linux-firmware@kernel.org>; Wed, 17 Apr 2024 11:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3BBB6C072AA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=PbFTxdXpY7GzbzvB2nZazZXs0kU8w/HploreA7Tbj5k=; t=1713352686; x=1714562286; 
	b=gNSJcrSaR7U5bQGdFXPTgiIlmyjPowsUFCJJ0waTUQJPS/dVFPW70PlTVqVwQn0dOytnGcrRbyd
	IuLBgsz1u2Ha0Vh21ochNCg7t/aI0buzqIfAIGPDf/uIcV0/P0LtrgTtKCKGPjhWgMxyGfKiN50oP
	+SOIGGaLfRwEIOFvOZCVWyyVS8qomypeLy9y3LuZr4jTxWAJOwn/7/wfQl5ytfXpTfJOyQQDmapMh
	Fu6VBd6eLMzTA1xg01InRzmNgL+sj7mBEVy92YQj1hfonVm6fymgnXdGBdBXK0nDyr1Gy3h+NtIgx
	9nIsqG9ZC7VJu0eiDNWALYHpkwqv4/VOedRw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rx3Ii-0000000Au0N-0M0W;
	Wed, 17 Apr 2024 13:18:04 +0200
Message-ID: <fec30176f437d565d4c1dfc4944373f117d75a64.camel@sipsolutions.net>
Subject: putting future iwlwifi firmware into intel/ ?
From: Johannes Berg <johannes@sipsolutions.net>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, miriam.rachel.korenblit@intel.com
Date: Wed, 17 Apr 2024 13:18:03 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned

Hi,

Since I was just looking at some firmware related thing (files for the
hardware that might be shared between Intel BT and WiFi), I noticed that
just over 30% of the files/dirs in the top-level firmware tree are
iwlwifi-* files.

While we can't move the files that older drivers might consume, we could
e.g. change the driver to look up future versions/future hardware under
intel/ instead? Would that be worth doing?

johannes
