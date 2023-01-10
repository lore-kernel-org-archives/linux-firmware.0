Return-Path: <SRS0=rokL=5H=metanate.com=john@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAEDC54EBC
	for <linux-firmware@archiver.kernel.org>; Tue, 10 Jan 2023 19:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D699C433EF; Tue, 10 Jan 2023 19:41:26 +0000 (UTC)
Received: from metanate.com (dougal.metanate.com [90.155.101.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 74EF7C433D2
	for <linux-firmware@kernel.org>; Tue, 10 Jan 2023 19:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 74EF7C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=metanate.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=metanate.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=metanate.com; s=stronger; h=Content-Type:Message-ID:Subject:Cc:To:From:Date
	:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=UVE4zfkA3qmQHDLZ5T/urzcdkQ22ivqIjkk4IKD9X/g=; b=h1
	gIJFLbT+8rMNNGzX0plPxlBj0bsQv7o389xk28acN7EfpK24SiROt4ZseThQn/Em2SKAiMfRlNOnp
	YDoftY4Rwg3qQXmQ5gSdpCF7L4CXEMgTaC47osLkTXHP2JFROABD2h6Pz4rfCJlME5SGfhRi5sQ1u
	IbxqYc4uFmQL6jvXYP1+pGAC0nF0XPPCx3ivQe8iD9Di2bcf5WqNI4hbUgIz60xivH+R8Qq/3W0ne
	p17WEglIxdXb7wM6iXpcpB3bqsJxI5d+1f2z3tLxRTNx9ilmI1GO2rPI+ZWY+LcUp13xU1fXnlI5a
	krqRWlhMzXh496gduD9Do35bJHCMp8aA==;
Received: from [81.174.171.191] (helo=donbot)
	by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <john@metanate.com>)
	id 1pFKUV-0001aS-17;
	Tue, 10 Jan 2023 19:40:59 +0000
Date: Tue, 10 Jan 2023 19:40:57 +0000
From: John Keeping <john@metanate.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Franky Lin <franky.lin@broadcom.com>,
	Hante Meuleman <hante.meuleman@broadcom.com>,
	linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
	SHA-cyfmac-dev-list@infineon.com, linux-firmware@kernel.org
Subject: brcm: brcmfmac4339 firmware in linux-firmware
Message-ID: <Y72/Sd/8mMOx13lk@donbot>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Authenticated: YES

Hi Arend & all,

In linux-firmware, commit 0707b2f ("brcm: add/update firmware files for
brcmfmac driver") adds brcm/brcmfmac4339-sdio.bin with version:

	Firmware: BCM4339/2 wl0: Feb 17 2016 18:29:33 version 6.37.32.RC23.34.42 (r608406)

This restores the version previously removed by commit 0f0aefd ("brcm:
remove old brcm firmwares that have newer cypress variants").

That was a follow-up to commit 04f71fe ("cypress: add Cypress firmware
and clm_blob files") which provides cypress/cyfmac4339-sdio.bin and
links it (via WHENCE) to brcm/brcmfmac4339-sdio.bin and has version:

	Firmware: BCM4339/2 wl0: Sep  5 2019 11:05:52 version 6.37.39.113 (r722271 CY)


It looks like the same also applies to a few other firmware, although I
don't have the hardware to check the relevant versions there.

Should part of 0707b2f ("brcm: add/update firmware files for brcmfmac
driver") be reverted in favour of the files in cypress/?  (It looks like
these will already be used due to the order of the file so the symlinks
to cypress/... will overwrite files installed from brcm/...)


Thanks,
John
