Return-Path: <SRS0=u2UF=7M=debian.org=bage@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55500C7618A
	for <linux-firmware@archiver.kernel.org>; Mon, 20 Mar 2023 16:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11ED0C433A1; Mon, 20 Mar 2023 16:45:12 +0000 (UTC)
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C2008C433A0
	for <linux-firmware@kernel.org>; Mon, 20 Mar 2023 16:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C2008C433A0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=TanlOj3uffOw+FzGAHWd7Fqxd3BcEqg6R1yxlAZAKoM=; b=cjubmaK/b43s3rILf1mbtFLhWh
	ValjV8x+54bpiFGdOngq7oa1H/o+7wenj6Mvd1L7W5OCkCXGuSuDyIZtFvgk7sDehzDEjhaB/FcgR
	A9Hmgq6jRDhphw/D3KQAI88vCrwJ1b10d3c6BCRI/OlSal7cH7hmhcczU2buIW58vG77CqNirY3iE
	6+QYibrwnB7WWEWARi6jkkJUoD80AC8MZqCyNnPdfqL8+EZ8SmzT4CGJzJ8OtUfNupfymVIZ9l9CF
	gkLS943hBV+DcTB62gkz508Xcmo/vU1s89hPX36r+CtHHvr59NaWU9b+Qm1uVd7VHOdyk5GWdaZxw
	diW4oc+g==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <bage@debian.org>)
	id 1peIcu-00EXOY-Da; Mon, 20 Mar 2023 16:44:52 +0000
From: Bastian Germann <bage@debian.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Bastian Germann <bage@debian.org>
Subject: [PATCH v2 0/1] rtl_bt: Add firmware for the Bluetooth part of RTL8723CS
Date: Mon, 20 Mar 2023 17:44:45 +0100
Message-Id: <20230320164448.3489-1-bage@debian.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Debian-User: bage

The btrtl support for RTL8723CS has entered bluetooth-next and so the
firmware should be provided with linux-firmware.

Changelog:
v2: Use file from realtek.com

Bastian Germann (1):
  rtl_bt: Add firmware for the Bluetooth part of RTL8723CS

 WHENCE                     |   4 ++++
 rtl_bt/rtl8723cs_xx_fw.bin | Bin 0 -> 19732 bytes
 2 files changed, 4 insertions(+)
 create mode 100644 rtl_bt/rtl8723cs_xx_fw.bin

-- 
2.39.2

