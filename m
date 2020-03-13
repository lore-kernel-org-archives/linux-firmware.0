Return-Path: <SRS0=ulAc=46=holtmann.org=marcel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C57A3C4CECE
	for <linux-firmware@archiver.kernel.org>; Fri, 13 Mar 2020 18:50:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BA9EF206B7; Fri, 13 Mar 2020 18:50:46 +0000 (UTC)
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
	by mail.kernel.org (Postfix) with ESMTP id D83CB20658
	for <linux-firmware@kernel.org>; Fri, 13 Mar 2020 18:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D83CB20658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=marcel@holtmann.org
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
	by mail.holtmann.org (Postfix) with ESMTPSA id C2870CED08;
	Fri, 13 Mar 2020 20:00:13 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH v3] Bluetooth: print fw build version in power-on boot
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200313051908.30815-1-amit.k.bag@intel.com>
Date: Fri, 13 Mar 2020 19:50:44 +0100
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
 linux-bluetooth@vger.kernel.org,
 ravishankar.srivatsa@intel.com,
 chethan.tumkur.narayan@intel.com,
 Sukumar Ghorai <sukumar.ghorai@intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3021AC7A-41EC-4002-B872-088AC2ACAA12@holtmann.org>
References: <20200313051908.30815-1-amit.k.bag@intel.com>
To: Amit K Bag <amit.k.bag@intel.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Message-ID: <20200313185044.H6tTG4x8VCM2JynhwvhUniu1WPtpBlcIHzKzkNjk5bg@z>

Hi Amit,

> To determine the build version of Bluetooth firmware to ensure =
reported
> issue related to a particular release. This is very helpful for every =
fw
> downloaded to BT controller and issue reported from field test.
>=20
> Signed-off-by: Amit K Bag <amit.k.bag@intel.com>
> Signed-off-by: Sukumar Ghorai <sukumar.ghorai@intel.com>
> ---
> drivers/bluetooth/btusb.c | 9 ++++++++-
> 1 file changed, 8 insertions(+), 1 deletion(-)

I have two v3 versions in my inbox. Please send me a clean v4 that is =
ready to be applied so that I don=E2=80=99t have to second guess.

Regards

Marcel

