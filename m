Return-Path: <SRS0=TIE+=KG=linux.intel.com=andriy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9DEC54E41
	for <linux-firmware@archiver.kernel.org>; Thu, 29 Feb 2024 15:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 81367C433C7; Thu, 29 Feb 2024 15:50:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 823DCC43330
	for <linux-firmware@kernel.org>; Thu, 29 Feb 2024 15:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 823DCC43330
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709221816; x=1740757816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GZE0x7MN9wdttWmfQeBDV4Ok6iQ1xOU7Uigi9vcGGK4=;
  b=iqUT4DSY7HI8P5iGOhFf8GhdvC6n0yqK1YJRMNAdFsuHHjjFvDxbuvZ3
   S3USL8hG1snmUjRLBUDb04gDTfw0fNPdY4alapa+zumy5xX0yPFD9dBd2
   aKz1KUhZxpsD8WeWtRXLEV3yYopOajxpB/RUnDhjjtbY6G1wjWcJGs5RQ
   GghpKutbk4gASG/quDTXJB/CH9Du9mYXVRHPB4r7Ye+4tggRWJ/+7dZcD
   6fUitrHysmp70dezr6rt3Bvbrw1/px1rxdiM9gvyLyDjKlvB1w8PkGo77
   1HX4bfpLbrX3+eBbTsT3ViCjeMrxXtrlmkuoJwkQSG+WKZC2t8VaZ4HWx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3554576"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3554576"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 07:50:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="913985062"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="913985062"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 07:50:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rfifj-00000008i5i-1hRh;
	Thu, 29 Feb 2024 17:50:11 +0200
Date: Thu, 29 Feb 2024 17:50:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Bingbu Cao <bingbu.cao@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [GIT PULL] Intel Image Processing Unit 2 firmware
Message-ID: <ZeCnszfWGrj7HpPu@smile.fi.intel.com>
References: <ZeCGEN8PgbkY3k_g@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZeCGEN8PgbkY3k_g@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 29, 2024 at 01:26:40PM +0000, Sakari Ailus wrote:
> Hi folks,
> 
> This PR adds firmware files for Intel IPU2. The atomisp driver that needs
> the firmware is currently in staging.
> 
> 
> The following changes since commit fe0274513384acb3be3756ae17da97f551a1e0e7:
> 
>   Merge branch 'robot/patch-0-1709160821' into 'main' (2024-02-28 23:13:23 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sailus/linux-firmware.git tags/ipu2-2024-02-29-2
> 
> for you to fetch changes up to 28fbeb4f8b8cf5fa214eeaa93c83d4ee779d7a5b:
> 
>   Intel IPU2: Add firmware files (2024-02-29 15:24:23 +0200)
> 
> ----------------------------------------------------------------
> IPU2 firmware binaries
> 
> ----------------------------------------------------------------
> Sakari Ailus (1):
>       Intel IPU2: Add firmware files

Whatever I commented on, please pull this. We have tons of users who will
benefit of this firmware to be supplied via linux-firmware rather harvesting
it somewhere else.

-- 
With Best Regards,
Andy Shevchenko


