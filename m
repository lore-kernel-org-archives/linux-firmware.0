Return-Path: <SRS0=bw5S=6G=holtmann.org=marcel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF36C54FCB
	for <linux-firmware@archiver.kernel.org>; Wed, 22 Apr 2020 17:45:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 24D3021569; Wed, 22 Apr 2020 17:45:40 +0000 (UTC)
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
	by mail.kernel.org (Postfix) with ESMTP id 60C4920882
	for <linux-firmware@kernel.org>; Wed, 22 Apr 2020 17:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60C4920882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcel@holtmann.org
Received: from [192.168.1.91] (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
	by mail.holtmann.org (Postfix) with ESMTPSA id 2FC1ECECFD;
	Wed, 22 Apr 2020 19:55:16 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 1/2] Bluetooth: btusb: Add support for Intel Bluetooth
 Device Typhoon Peak (8087:0032)
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200417095012.8443-1-amit.k.bag@intel.com>
Date: Wed, 22 Apr 2020 19:45:38 +0200
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 "Srivatsa, Ravishankar" <ravishankar.srivatsa@intel.com>,
 Chethan T N <chethan.tumkur.narayan@intel.com>,
 "Hegde, Raghuram" <raghuram.hegde@intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E5A033B8-8422-48BD-AC02-AB97574B57E4@holtmann.org>
References: <20200417095012.8443-1-amit.k.bag@intel.com>
To: Amit K Bag <amit.k.bag@intel.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)

Hi Amit,

>=20
> Signed-off-by: Amit K Bag <amit.k.bag@intel.com>
> ---
> drivers/bluetooth/btusb.c | 2 ++
> 1 file changed, 2 insertions(+)

please include the content of /sys/kernel/debug/usb/devices for this =
hardware.

Regards

Marcel

