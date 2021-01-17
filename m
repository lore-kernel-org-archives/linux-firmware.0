Return-Path: <SRS0=i+q+=GV=alistair23.me=alistair@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A842FC433DB
	for <linux-firmware@archiver.kernel.org>; Mon, 18 Jan 2021 03:05:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 88659223E8; Mon, 18 Jan 2021 03:05:56 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34AA8223DB
	for <linux-firmware@kernel.org>; Mon, 18 Jan 2021 03:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34AA8223DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alistair23.me
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=alistair@alistair23.me
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 851B15C00FF;
	Sun, 17 Jan 2021 22:05:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sun, 17 Jan 2021 22:05:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm3; bh=N8g8PJPRriM0LnscuLI64ay545
	edFk2mpNtFXv+gLpw=; b=Y+23cIDG0bXUivyYdM5Ry9cE1+QhDOe323T3pq842F
	hzXzsM3GF4s1V9EtdRsrhOeGjPJK20M8AKhYhyt0OeCfGtpY2aULQ74J5ncE6m8R
	nWduF/CXd/m4qIWUbr9V0LSrFuhPR+Z9pbYwHQRAV0/06VKMv++LW4U+amQh4S2d
	f7Y0+HtVmA7u5B0bVXZMV6Qt5yGpGd83Iw+3/I571vVhbdQv4KT4H5plkGY6ScXo
	MqvS4jXFFOhRM1O3dOTm5D/zRv7IwibmcW2AFMX0kG94M97PHUzFGytEteYSy1YK
	/q4Orh81hHs8Iei6JQb3uyTKIh5mG3sipBzXVHajlzZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=N8g8PJPRriM0Lnscu
	LI64ay545edFk2mpNtFXv+gLpw=; b=UqLnV4Mr4Xrn27qEKoeTQospt2gzUM1oS
	gnn4SUmKPvF+qF4yxZL17i3xsrVtxjjcPmycg8+bBkAVnd1SY0sBpGbFhnz7v/fR
	TUqtO8+ENDM5YhnyVDRxNVe1ajh5Hwpyp4qc1JwGSVF7TneHRPxj8qY1Ch1x9ZTM
	rfZYm6G7oeN2sq1pQwZZ03pdyrSHZMtjDzo6Bt0hLa5nbmW5ZBwSeTCvGA3+8ZBM
	OKWDjMdzqoMwM9CA6jeA/JXLZDt//oCoWbWrwvqcFihY1v0Od6D8cwekNr+WHWiC
	7F7ohpoRBeOkN0ix2Ko4xcZasa6u4omrLXqz0+lb+e6iwsYrh6F5Q==
X-ME-Sender: <xms:E_sEYHhuyL577Pi65bk-A6xzPpcs-fp1vxAr8b0zPJh367BgO1mOqg>
    <xme:E_sEYED1LH1ZoBhqf_Nsp4EHdUN_5msomv-kUwpgJwt54NBWejoEVIptt5alPEPtJ
    IAeAwKMudc18oCWP2I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghirhes
    rghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepjeeliefhvdetgfdtte
    fhtdegffdtiefffeejiefffeevueeljeehjeevhfffueeknecukfhppeejfedrleefrdek
    gedrvddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:E_sEYHFE3D4bQ4TdemV0Cqqq8dFzlKDQoTU9mbuU9ZODaxxQBvhgUw>
    <xmx:E_sEYEQWVgTLsOhUA-4Qv4oRjlyeVNN0B2Tu01wUmYSXKDMgPvkugQ>
    <xmx:E_sEYExXnOt1Fpx57pBPJlt6H4rCD1TJTf0rApGMskG2W7VnPVu-QA>
    <xmx:E_sEYBuQIrHW8w3vQXXkq0SsOg04L3M0TagksloYtNixpdFnRLDiLw>
Received: from ThinkpadX1Yoga3.localdomain (c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
	by mail.messagingengine.com (Postfix) with ESMTPA id D59331080059;
	Sun, 17 Jan 2021 22:05:54 -0500 (EST)
From: Alistair Francis <alistair@alistair23.me>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair@alistair23.me>
Subject: [PULL 0/1] brcmfmac434 queue
Date: Sat, 16 Jan 2021 23:48:16 -0800
Message-Id: <20210117074817.1721-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit d5288624259300c558480c21a860fcf94187d29d:

  brcm: Add NVRAM for Vamrs 96boards Rock960 (2021-01-09 07:31:33 -0500)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git pull-brcmfmac434-20210117

for you to fetch changes up to 20a40e594782f8d93fed3106cafa02020c019ac8:

  brcm: Add the brcmfmac43456-sdio.* files (2021-01-17 18:46:48 -0800)

----------------------------------------------------------------
brcm: Add the brcmfmac43456-sdio.* files

----------------------------------------------------------------
Alistair Francis (1):
      brcm: Add the brcmfmac43456-sdio.* files

 brcm/brcmfmac43456-sdio.bin      | Bin 0 -> 495898 bytes
 brcm/brcmfmac43456-sdio.clm_blob | Bin 0 -> 7163 bytes
 brcm/brcmfmac43456-sdio.txt      |  97 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 brcm/brcmfmac43456-sdio.bin
 create mode 100644 brcm/brcmfmac43456-sdio.clm_blob
 create mode 100644 brcm/brcmfmac43456-sdio.txt
