Return-Path: <SRS0=6XPL=TN=w1.fi=j@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C8AC433F5
	for <linux-firmware@archiver.kernel.org>; Wed,  2 Mar 2022 17:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42948C340ED; Wed,  2 Mar 2022 17:50:30 +0000 (UTC)
Received: from mail.w1.fi (mail.w1.fi [212.71.239.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A69BDC004E1;
	Wed,  2 Mar 2022 17:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A69BDC004E1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=w1.fi
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=w1.fi
Received: from localhost (localhost [127.0.0.1])
	by mail.w1.fi (Postfix) with ESMTP id 9C0CD10FB1;
	Wed,  2 Mar 2022 17:50:18 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at w1.fi
Received: from mail.w1.fi ([127.0.0.1])
	by localhost (mail.w1.fi [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XhKH9mXcoUA0; Wed,  2 Mar 2022 17:50:16 +0000 (UTC)
Received: by jm (sSMTP sendmail emulation); Wed, 02 Mar 2022 19:50:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=w1.fi; s=default;
	t=1646243416; bh=hjH28rMHWPqV8u0M5BGXXoiITE9qsVcforZPtpPdcFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vnqwv9F++gHGVjfVTdR6PEJoJ+v6+hnA5LTehj8YD7vvxvVAhJH1h1DBxo+9ANJEt
	 iC+XiV4ASw3VfN7HoVnSmIP4WpgXmnOvN/7WF2qSc6eLHxSQkH6G3zx7LRnh6sFHrk
	 43u1B3UnmLuNPLRfhGQfCK2PXtmzG2uk2a9BRZkq0Me1syNXuUXSqO0up2yIfygOqX
	 OebZMG+RTuLXAq7EoWajL8HwlrT4kVqdFU9+tGN4OMbA7oG2pHFKPNaulUfDXO70yS
	 5uD9XljTn7OR939AXTOF5uk4V3WEa++BTHtLIDjWdkShvaqJ5oSFT1I8QseeSxU09C
	 mFmkNJ/D/0+UQ==
Date: Wed, 2 Mar 2022 19:50:14 +0200
From: Jouni Malinen <j@w1.fi>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: [PULL] ath11k firmware 20211223
Message-ID: <20220302175014.GA14801@w1.fi>
References: <BYAPR02MB4567669033A210A78AC397E9927E9@BYAPR02MB4567.namprd02.prod.outlook.com>
 <CA+5PVA4WEuJDB3OCKfYK-BPaccpVWd9t_au9S7MCEtpy7cdF-A@mail.gmail.com>
 <87ee4brodv.fsf@kernel.org>
 <CA+5PVA5DJmwPqpz8F9iDbJKcF1hDBRLdDT4URgSaiEcjet74Kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+5PVA5DJmwPqpz8F9iDbJKcF1hDBRLdDT4URgSaiEcjet74Kw@mail.gmail.com>

On Fri, Feb 18, 2022 at 10:55:37AM -0500, Josh Boyer wrote:
> On Thu, Feb 10, 2022 at 5:45 AM Kalle Valo <kvalo@kernel.org> wrote:
> > > On Thu, Dec 23, 2021 at 9:03 AM Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> > >>
> > >>  WHENCE                           |   14 +-
> > >>  ath11k/IPQ6018/hw1.0/Notice.txt  |   48 +-

> > > These Notice files seem problematic.  They're clearly well intended,
> > > but they have language that alludes to an agreement with Atheros and a
> > > confidential nature to some of the files.  Specifically:
> > >
> > > "...your use of these software
> > > components together with the Qualcomm Atheros software (Qualcomm
> > > Atheros software hereinafter referred to as “Software”) is
> > > subject to the terms of your agreement from Qualcomm Atheros."
> > >
> > > Nobody has an opportunity to agree to anything with Atheros when they
> > > consume the files from linux-firmware.  There's also no explicit grant
> > > of redistribution for any of these files.

This is not the license; this is a description of the notice.txt file
containing the notices to cover the 3rd party license requirements for
attribution/notices included in redistribution of those parts.

> > So this file we are discussing is the notice.txt file. In the WHENCE
> > file the actual license for ath11k is:
> >
> > Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k for details

And this is where the license is and this includes license to
redistribute.

> Then is the notice.txt file needed at all?  If a user or distribution
> were to install this firmware, is the expectation that the notice.txt
> file also be installed?

Those 3rd party license might require various notifications to be
included for notification/attribution purposes, so I would expect the
notice.txt file to be redistributed whenever the firmware image is
redistributed.

> > Does that cover your concerns about redistribution?
> 
> Not really.  I understand the logic, but if the binding license for
> the firmware is LICENSE.QualcommAtheros_ath10k but we still need
> notice.txt for some reason, they conflict.  It's ambiguous at best.

Could you please be more specific on where you see a conflict? Maybe
this would be clearer if the WHENCE file would not mark the notice.txt
files with the "License: <file>" lines since these are not the license
for the firmware binary and then there would be a single "License:" line
pointing out the exact license that applies?

Would the following in WHENCE work for you?

Driver: ath11k - Qualcomm Technologies 802.11ax chipset support

File: ath11k/IPQ6018/hw1.0/board-2.bin
...
Version: WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2
Notice: ath11k/IPQ6018/hw1.0/Notice.txt
...
File: ath11k/QCA6390/hw2.0/m3.bin
Version: WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
Notice: ath11k/QCA6390/hw2.0/Notice.txt

Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k for details


In other words, there would be only a single "License:" line and one
"Notice:" line for each firmware version? The license itself (i.e.,
LICENSE.QualcommAtheros_ath10k) is same for all the versions while the
set of notices (i.e., those notice.txt files) can be different based on
what is included in the particular build.

> > I'm still working on your other comment about notice.txt, will get back
> > on that later.

This part about clearly identifying the files should be clear now, but
it would be good to resolve that part about the notice.txt files in
general before sending out an updated pull request.

-- 
Jouni Malinen                                            PGP id EFC895FA
