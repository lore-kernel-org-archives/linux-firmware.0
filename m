Return-Path: <SRS0=I4Q9=KK=linux.intel.com=sakari.ailus@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28344C48BF6
	for <linux-firmware@archiver.kernel.org>; Mon,  4 Mar 2024 08:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 063CFC43399; Mon,  4 Mar 2024 08:06:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 05C87C433F1;
	Mon,  4 Mar 2024 08:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 05C87C433F1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709539571; x=1741075571;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IAtOb9eDbJ1Ad/ilAiWzkXr5nva445x/2USlMGCaY/4=;
  b=VJI2x8hfnBx9sCLcyNt2B6GwjomxrChFQxNK5M319m+OXBCBfsWfnsIR
   L+U809lCcZKugv4VxSfw0+N7OVhc+es+PaJDdOOL/h5V19hxYYBDBIyAj
   YdjEbNW8HFzsdUuHSVaDiyYW+9jx/m+/BzPMAkB8ZqJ42ccpBQP+Kx0kL
   w+AeSO0FP4APBtmbyKMxejerAu/BDPB7Jhynuw2wtcXaw5oGn6jxCdizy
   zzbqhjwb7BnZB+jeNy5Bl5mNGXJwjTLnWFYB8z7CbYiwVNNjfwIBhSL1L
   Y6oHQXMbHWqMxwWJ6mRbPWLPEEUN0BClmG2W8yq+lUB4y6HqCvcCxGZ4x
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="29440293"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="29440293"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 00:06:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="46419712"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 00:06:08 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2592111F8B1;
	Mon,  4 Mar 2024 10:06:05 +0200 (EET)
Date: Mon, 4 Mar 2024 08:06:05 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Bingbu Cao <bingbu.cao@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [GIT PULL] Intel Image Processing Unit 2 firmware
Message-ID: <ZeWA7bbD4CGw22MU@kekkonen.localdomain>
References: <ZeCGEN8PgbkY3k_g@kekkonen.localdomain>
 <CA+5PVA4PM-53Y4pEdD39-kx_+OishOghz9ePwxNfpSpSN3DReg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+5PVA4PM-53Y4pEdD39-kx_+OishOghz9ePwxNfpSpSN3DReg@mail.gmail.com>

On Fri, Mar 01, 2024 at 02:19:06PM -0500, Josh Boyer wrote:
> > The following changes since commit fe0274513384acb3be3756ae17da97f551a1e0e7:
> >
> >   Merge branch 'robot/patch-0-1709160821' into 'main' (2024-02-28 23:13:23 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/sailus/linux-firmware.git tags/ipu2-2024-02-29-2
> 
> Merged and pushed out.
> 
> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/162

Thanks, Josh!

-- 
Sakari Ailus
