Return-Path: <SRS0=qPP9=A3=chelsio.com=rahul.lakkireddy@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A800C77B75
	for <linux-firmware@archiver.kernel.org>; Sat,  6 May 2023 12:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2A5E6C4339B; Sat,  6 May 2023 12:03:45 +0000 (UTC)
Received: from stargate.chelsio.com (stargate.chelsio.com [12.32.117.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5B5E8C433EF;
	Sat,  6 May 2023 12:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5B5E8C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=chelsio.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chelsio.com
Received: from localhost (abdul.asicdesigners.com [10.193.177.152] (may be forged))
	by stargate.chelsio.com (8.14.7/8.14.7) with ESMTP id 346C3WlF016250;
	Sat, 6 May 2023 05:03:33 -0700
Date: Sat, 6 May 2023 17:33:31 +0530
From: Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org, rahul.lakkireddy@chelsio.com
Subject: Re: pull request: linux-firmware: update cxgb4 firmware to 1.27.3.0
Message-ID: <ZFZCE0bl5MAHreT6@chelsio.com>
References: <ZDmEHfsR6moy21pf@chelsio.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZDmEHfsR6moy21pf@chelsio.com>

On Friday, April 04/14/23, 2023 at 22:19:35 +0530, Rahul Lakkireddy wrote:
> Please pull the new Chelsio firmware from the following URL.
> 
>   http://git.chelsio.net/pub/git/linux-firmware.git for-upstream
> 
> Thanks,
> Rahul
> 
> 
> The following changes since commit 86da2ac9b4e57e9a88f8bfcb5a163a406f5c00e1:
> 
>   Merge https://github.com/pkshih/linux-firmware (2023-04-06 07:30:31 -0400)
> 
> are available in the Git repository at:
> 
>   http://git.chelsio.net/pub/git/linux-firmware.git for-upstream
> 
> for you to fetch changes up to 3afc3927f1d5a244d0b930771143b256d5e7c960:
> 
>   cxgb4: Update firmware to revision 1.27.3.0 (2023-04-14 14:35:32 +0000)
> 
> ----------------------------------------------------------------
> Rahul Lakkireddy (1):
>       cxgb4: Update firmware to revision 1.27.3.0
> 
>  WHENCE                                         |  12 ++++++------
>  cxgb4/{t4fw-1.27.1.0.bin => t4fw-1.27.3.0.bin} | Bin 570880 -> 570880 bytes
>  cxgb4/{t5fw-1.27.1.0.bin => t5fw-1.27.3.0.bin} | Bin 678400 -> 678912 bytes
>  cxgb4/{t6fw-1.27.1.0.bin => t6fw-1.27.3.0.bin} | Bin 730112 -> 730624 bytes
>  4 files changed, 6 insertions(+), 6 deletions(-)
>  rename cxgb4/{t4fw-1.27.1.0.bin => t4fw-1.27.3.0.bin} (59%)
>  rename cxgb4/{t5fw-1.27.1.0.bin => t5fw-1.27.3.0.bin} (50%)
>  rename cxgb4/{t6fw-1.27.1.0.bin => t6fw-1.27.3.0.bin} (59%)


Ping... Please let us know if there are any issues with the pull
request.

Thanks,
Rahul
