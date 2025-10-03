Return-Path: <SRS0=CC+l=4M=testtoast.com=ryan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDC1CCA471
	for <linux-firmware@archiver.kernel.org>; Fri,  3 Oct 2025 12:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98511C4CEFA; Fri,  3 Oct 2025 12:20:21 +0000 (UTC)
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E4A85C4CEF5
	for <linux-firmware@kernel.org>; Fri,  3 Oct 2025 12:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E4A85C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id B6B191D0011A;
	Fri,  3 Oct 2025 08:20:18 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 03 Oct 2025 08:20:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1759494018; x=
	1759580418; bh=/zcAyMi7iRvz6DT9Srqlkg41Q0hHrE7Mrjqu6LbnD9w=; b=o
	5JVBmwOsLt06LaLc/7ipjSZv7RQAjFNamo4e3XlCgqTI2egrt7VrC5ugFIzwXWAL
	AnrvFwzCBxlky8G81UCp4mSLHUGF6wv42LAbQZg29sICy6PGXT8w2XuegQ5BL7OS
	GYyzqFo4gHS6iyBj7tUB+DuhvIZBOzHigbAD66/Zo3dRYNqc8sHrWeaF9+vycx5X
	AHHGly4KOd9Jj66wEMaQEmP0GzG+09ZeLl12XHrBeH1oXlA1a1auNpABp3rTM6vy
	jKOb2qaS9lA36IleyQCXI0sRZuOLql5oDhXNtnuCoLZxei6Z81YPj3XLOyeNzGc3
	bMUI26rlkBnMmkgeFadFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1759494018; x=1759580418; bh=/
	zcAyMi7iRvz6DT9Srqlkg41Q0hHrE7Mrjqu6LbnD9w=; b=m6oEZU1E72b1Gz5nA
	ClcHGcxnvZkFlcAdjRRvDg0YSTByjQto/cFEHL9wqFBvIpWI4/poVv+0ytVYwtoU
	lovBVsTsFhk7I27Bmi98XQUiQnT9YT4HfwkLJfrozRYT0NQzWMFiyrFld/yzsoBm
	x/Nmz0XcRu8ZOBFjFeFP9tthq0w6Cky2ayLn8KHQZm2sKHoynvQcC9m2Bg2GuIcW
	+zP+DD5QlTAQZTR8j4xP3UywEHzhFXJoujh/uA7SQ4IycSNZmg/M76kGfznNp/gp
	9Obi+ac2xZv6s1DGl77sGdT0tZTcbELTJEpHHuEj0PzTBBq5VPPDOzcwNI7LYqHZ
	e2Xzg==
X-ME-Sender: <xms:gr_faMxhN-OatVnL2bpk2C9b8BbCfRrQNu1FfXkxQ5-rXpU8a145lQ>
    <xme:gr_faItGRdkWeW_j3lE-vY6bvbMLedkdVjNFcZyL3C-DWTYVcwyESDaYfCekh-5GG
    rRE0lgO2DlM0C3Ehtze2ZujQFraI1yDSOhNiFPYP72ZuWv4duC_>
X-ME-Received: <xmr:gr_faOxa8TWJjcNq0dYuu2KXrcr2pqN4_ruyj6nAM-LLKPVXitdK8DxVbLPUNpxVH39mWVSY_LkURHhppFMgTe7QlUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekkeekkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekredtre
    dttdenucfhrhhomheptfihrghnucghrghlkhhlihhnuceorhihrghnsehtvghsthhtohgr
    shhtrdgtohhmqeenucggtffrrghtthgvrhhnpeelfedtledvgffftdevudejudegkeetve
    ejtefgkeduueejveejheefheevgfeiteenucffohhmrghinheprghlphhinhgvlhhinhhu
    gidrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgspghrtghpthhtohepiedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheprghllhgrnhdrfigrnhhgsehmvgguihgrth
    gvkhdrtghomhdprhgtphhtthhopehmihhnghihvghnrdhhshhivghhsehmvgguihgrthgv
    khdrtghomhdprhgtphhtthhopehlihhnuhigqdhfihhrmhifrghrvgeskhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinhhf
    rhgruggvrggurdhorhhgpdhrtghpthhtohepshgrmhesghgvnhhtohhordhorhhgpdhrtg
    hpthhtohepgihirghnghiihhgvuggvvhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:gr_faLCNea9K211UiNqGzkynV2HJvBcKBHobrrVf8fJ9Wfck-2FScw>
    <xmx:gr_faMeSfbmNEv37aYdOu_NE4X32vAUQ0-ZWdyt19g11pvsL4Fybfw>
    <xmx:gr_faFm_0rsx5C6VC5ZodAZAF7il-RjCFmViDBAiVK9NrS0ySkKo-Q>
    <xmx:gr_faDFzf-NFtoSrvBPlEH5R54kF-EbcT6LqecT3k1VD9-mTCq-yLA>
    <xmx:gr_faFkn_svGOA1p3Th96qO8XCkBRC1N4PxzjT5poxEJiTss81QVHcqm>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Oct 2025 08:20:15 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: allan.wang@mediatek.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: Mingyen.Hsieh@mediatek.com,
	linux-firmware@kernel.org,
	linux-mediatek@lists.infradead.org,
	sam@gentoo.org,
	xiangzhedev@gmail.com
Subject: Re: Regression in linux-firmware-20250917 for mt7921e driver
Date: Sat,  4 Oct 2025 01:19:27 +1300
Message-ID: <20251003122000.7335-1-ryan@testtoast.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <dda63a6b723d31f41e6e275ac7f38d31c6715fc8.camel@mediatek.com>
References: <dda63a6b723d31f41e6e275ac7f38d31c6715fc8.camel@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I have a laptop with a mt7921e wifi chip (Lenovo Z13) and can confirm that firmware-20250917 prevents wifi from working, downgrading to the prior version from August or passing

"mt7921_common disable_clc=1"

restores functionality.

Also reported to Alpine - https://gitlab.alpinelinux.org/alpine/aports/-/issues/17560

Thanks,

Ryan
