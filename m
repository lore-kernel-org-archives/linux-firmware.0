Return-Path: <SRS0=LgQV=II=coelho.fi=luca@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15798C433E6
	for <linux-firmware@archiver.kernel.org>; Wed, 10 Mar 2021 09:26:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C3A8764FF7; Wed, 10 Mar 2021 09:26:49 +0000 (UTC)
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33F5D64F7D;
	Wed, 10 Mar 2021 09:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33F5D64F7D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=coelho.fi
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=luca@coelho.fi
Received: from 91-156-6-193.elisa-laajakaista.fi ([91.156.6.193] helo=[192.168.100.150])
	by farmhouse.coelho.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <luca@coelho.fi>)
	id 1lJv6z-004SIf-95; Wed, 10 Mar 2021 11:26:38 +0200
Message-ID: <42eb781e8f89b92ff54a4d65b0916d420eb2a381.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
List-Id: <linux-firmware.lore.kernel.org>
To: Thomas Backlund <tmb@tmb.nu>, "linux-firmware@kernel.org"
	 <linux-firmware@kernel.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"kyle@infradead.org"
	 <kyle@infradead.org>, "jwboyer@kernel.org" <jwboyer@kernel.org>, 
	"ben@decadent.org.uk"
	 <ben@decadent.org.uk>, golan.ben.ami@intel.com
Date: Wed, 10 Mar 2021 11:26:35 +0200
In-Reply-To: <69d01bfd-a15f-2ebb-b55a-c6864a065e1f@tmb.nu>
References: <8e3877efc92f413d47ee1d71a119885c765d7312.camel@coelho.fi>
	 <69d01bfd-a15f-2ebb-b55a-c6864a065e1f@tmb.nu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: pull request: iwlwifi firmware updates 2021-03-05-v2

Your email was in HTML, so it probably didn't reach the list.

On Wed, 2021-03-10 at 09:09 +0000, Thomas Backlund wrote:
> 
> More  "issues"...
> 
> Den 9.3.2021 kl. 13:57, skrev Luca Coelho:
> Hi,
> 
> This is v2 of my update which contains some new and updated files for
> all our currently maintained FW binaries.
> 
> In v2:
> 
>    * Fixed WHENCE so that the new files match, with "62" instead of
>    "59".
> 
> Please pull or let me know if there are any issues.
> 
> --
> Cheers,
> Luca.
> 
> 
> The following changes since commit
> 5ecd13ffe8e24385cf4f30f3d0dcaff4dfb24de2:
> 
>   Mellanox: Add new mlxsw_spectrum firmware xx.2008.2406 (2021-03-03
> 13:23:49 -0500)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-
> firmware.git iwlwifi-fw-2021-03-05-v2
> 
> for you to fetch changes up to
> b46d336044c448987589bd6cf3057f404c5581ad:
> 
>   iwlwifi: add new FWs from core59-66 release (2021-03-09 13:51:26
> +0200)
> 
> ----------------------------------------------------------------
> Update iwlwifi firmwares to Core59-66
> 
> ----------------------------------------------------------------
> Luca Coelho (3):
>       iwlwifi: update 7265D firmware
> 
> This one looks old... stuck in limbo for over 1.5 years... is that
> correct ?
> author    Luca Coelho <luciano.coelho@intel.com>    2019-08-23
> 07:35:14 +0300
>  committer    Luca Coelho <luciano.coelho@intel.com>    2021-03-05
> 11:37:56 +0200

Oh, I just reused the commit message from before and edited it as
needed.  Does it really matter?

>       iwlwifi: update 9000-family firmwares
> 
> This one adds duplicated fileinfo in WHENCE
>  
> https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git/commit/?id=a6720504c812c1e8b0979a81d15b6ce6b4d87ae7
> instead of updating existing ones.

Okay, I'll fix it.

>       iwlwifi: add new FWs from core59-66 release
> 
> This one still adds some duplicated WHENCE stuff for  *-59.ucode:
>  
> https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git/commit/?id=b46d336044c448987589bd6cf3057f404c5581ad
> 
> +File: iwlwifi-cc-a0-59.ucode
> +Version: 59.49eeb572.0
> +
> +File: iwlwifi-Qu-b0-hr-b0-59.ucode
> +Version: 59.49eeb572.0

Yep, copy/paste issue again, I'll fix it.

--
Luca.

