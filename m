Return-Path: <SRS0=/yWH=XM=demerara.io=ben@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FA1C433EF
	for <linux-firmware@archiver.kernel.org>; Thu,  7 Jul 2022 17:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 969C5C341C6; Thu,  7 Jul 2022 17:04:14 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C2B73C3411E
	for <linux-firmware@kernel.org>; Thu,  7 Jul 2022 17:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C2B73C3411E
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=demerara.io
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=demerara.io
Received: (Authenticated sender: ben@demerara.io)
	by mail.gandi.net (Postfix) with ESMTPSA id 5E422100005;
	Thu,  7 Jul 2022 17:04:01 +0000 (UTC)
Message-ID: <cb49da01-584a-bb71-eecb-c54e40bce062@demerara.io>
Date: Thu, 7 Jul 2022 18:04:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:103.0) Gecko/20100101
 Thunderbird/103.0a1
Subject: Re: [PATCH 2/3] wfx: add antenna configuration files
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Jerome Pouiller <Jerome.Pouiller@silabs.com>,
 linux-wireless@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>,
 linux-firmware@kernel.org
Cc: devel@driverdev.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, jerome.pouiller@gmail.com
References: <20220221163754.150011-1-Jerome.Pouiller@silabs.com>
 <20220221163754.150011-3-Jerome.Pouiller@silabs.com>
From: Ben Brown <ben@demerara.io>
In-Reply-To: <20220221163754.150011-3-Jerome.Pouiller@silabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/02/2022 16:37, Jerome Pouiller wrote:
> From: Jérôme Pouiller <jerome.pouiller@silabs.com>
<snip>
> diff --git a/WHENCE b/WHENCE
> index 0a6cb15..96f67f7 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -5845,8 +5845,18 @@ Driver: wfx - Silicon Labs Wi-Fi Transceiver
>  File: wfx/wfm_wf200_C0.sec
>  Version: 3.12.1
>  
> +File: wfx/brd4001a.pds not listed in WHENCE
> +File: wfx/brd8022a.pds not listed in WHENCE
> +File: wfx/brd8023a.pds not listed in WHENCE

This format does not appear to be correct. While this will seemingly
pass the `check_whence.py` check, it will be completely ignored by
`copy-firmware.sh`, as that takes the full line after 'File: ' (e.g.
'wfx/brd4001a.pds not listed in WHENCE', which of course does not exist).

I'm assuming the trailing ' not listed in WHENCE' needs to be removed
from each of these lines. Otherwise these are likely not being picked up
by distros (they are missing from Arch, for example). This may have been
the intention, but that seems odd (and unclear if so).


Regards,
Ben
