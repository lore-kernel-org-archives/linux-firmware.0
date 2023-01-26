Return-Path: <SRS0=TgfP=5X=metanate.com=john@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3CEC54E94
	for <linux-firmware@archiver.kernel.org>; Thu, 26 Jan 2023 10:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7A6A5C433D2; Thu, 26 Jan 2023 10:50:26 +0000 (UTC)
Received: from metanate.com (dougal.metanate.com [90.155.101.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 50754C4339E
	for <linux-firmware@kernel.org>; Thu, 26 Jan 2023 10:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 50754C4339E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=metanate.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=metanate.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=uxb6AnpT8zwy9btrX85Tu9tarEKKrblSBGHJo+4fsr0=; b=oFVa5
	7JjkA+jiM3EspH5G+PylPcauqIYBI3wIoNHiHzrEqKJVnpEt3g7xgexdC0t1kKZ3rwVCvrl4RIudI
	WPmM5fP2u3J+hHcQX9+FUiBP42f1blG/lDDHf0RWLlQn9OUU/WhV01TWBLD/zyfvM9iE3tzdp4S2d
	LtTp9upJFUiuCNc6QsEgvPRxRH+Shzp98lb0PCqL+6cNNcAtvn3pM9LnGPmMgDPYJfTUHtPcrhBDJ
	BaLUvvUMPpWPEH1vgnQW6oIagqTHvwSMxhViPUOT/ryAFtxnAxySfagYyerzK9QXuCeu0Oyi8wDE0
	WRdhulNb8dQV6aZfjXUQZNe5V4kiA==;
Received: from [81.174.171.191] (helo=donbot)
	by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <john@metanate.com>)
	id 1pKzpN-0001TQ-Ri;
	Thu, 26 Jan 2023 10:49:57 +0000
Date: Thu, 26 Jan 2023 10:49:56 +0000
From: John Keeping <john@metanate.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Franky Lin <franky.lin@broadcom.com>,
	Hante Meuleman <hante.meuleman@broadcom.com>,
	linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
	SHA-cyfmac-dev-list@infineon.com, linux-firmware@kernel.org
Subject: Re: brcm: brcmfmac4339 firmware in linux-firmware
Message-ID: <Y9Ja1CM5tgkditHK@donbot>
References: <Y72/Sd/8mMOx13lk@donbot>
 <7ffbf116-3252-8347-a621-ca9ef120e263@broadcom.com>
 <a08ccf64-652e-7ca1-2470-01514aab09ec@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a08ccf64-652e-7ca1-2470-01514aab09ec@broadcom.com>
X-Authenticated: YES

On Thu, Jan 26, 2023 at 11:41:53AM +0100, Arend van Spriel wrote:
> On 1/26/2023 11:15 AM, Arend van Spriel wrote:
> > On 1/10/2023 8:40 PM, John Keeping wrote:
> > > That was a follow-up to commit 04f71fe ("cypress: add Cypress firmware
> > > and clm_blob files") which provides cypress/cyfmac4339-sdio.bin and
> > > links it (via WHENCE) to brcm/brcmfmac4339-sdio.bin and has version:
> > 
> > Looking into this now, but how does this work. What does that (via
> > WHENCE)? Guess I missed something fundamental here.
> 
> Assuming the copy-firmware.sh is taking care of the links.

Yes, `make install` calls copy-firmware.sh which reads the Link: lines
from WHENCE and creates the symlinks specified by those lines.


Regards,
John
