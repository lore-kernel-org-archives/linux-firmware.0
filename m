Return-Path: <SRS0=TIE+=KG=linux.intel.com=andriy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F006C54E41
	for <linux-firmware@archiver.kernel.org>; Thu, 29 Feb 2024 14:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F047AC43390; Thu, 29 Feb 2024 14:14:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 222C9C433F1
	for <linux-firmware@kernel.org>; Thu, 29 Feb 2024 14:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 222C9C433F1
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709216042; x=1740752042;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NIVUBvo7KQDUNXCDFG0f1QRo3k5ElI37QHByodx3QR4=;
  b=dWzO1nixa7NSCuiq591p2naNgZJBN42uIiun4m4mmgrKNGRaopexRcCo
   ximR2XcU97rbR7U/E16OQMBq78BnIhlMvySKgt3dE05JzZ15W5zl5gPQ2
   KYKyi+O7kwBbKvQ3BSpe+7vgt/TA4lxHmKucWCEWxXHQKBrMYP4igPd+/
   Bnt8tkvAeZERSljJu4ewhG9AXw5HUfaZ0HX5CRauenD4Io3R7p5i7Wd/1
   +JKo90oKVXWuIXKalVbSJClVsQtPWI0U06zwnN4qnTg7bzq+jfp+v0OPQ
   y/fsGbnZ2EJlzrIEZlbqukJr73D0wt03Nws10FdHyqsBIv/ryJppk/lTX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="29118516"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="29118516"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 06:14:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="913983055"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="913983055"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 06:14:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rfhAb-00000008gq7-2taY;
	Thu, 29 Feb 2024 16:13:57 +0200
Date: Thu, 29 Feb 2024 16:13:57 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Bingbu Cao <bingbu.cao@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [GIT PULL] Intel Image Processing Unit 2 firmware
Message-ID: <ZeCRJWoUHLGmbdiJ@smile.fi.intel.com>
References: <ZeCGEN8PgbkY3k_g@kekkonen.localdomain>
 <ZeCP1y5RZXAXBTEB@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZeCP1y5RZXAXBTEB@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 29, 2024 at 04:08:24PM +0200, Andy Shevchenko wrote:
> On Thu, Feb 29, 2024 at 01:26:40PM +0000, Sakari Ailus wrote:
> > Hi folks,
> > 
> > This PR adds firmware files for Intel IPU2. The atomisp driver that needs
> > the firmware is currently in staging.
> > 
> > 
> > The following changes since commit fe0274513384acb3be3756ae17da97f551a1e0e7:
> > 
> >   Merge branch 'robot/patch-0-1709160821' into 'main' (2024-02-28 23:13:23 +0000)
> > 
> > are available in the Git repository at:
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/sailus/linux-firmware.git tags/ipu2-2024-02-29-2
> > 
> > for you to fetch changes up to 28fbeb4f8b8cf5fa214eeaa93c83d4ee779d7a5b:
> > 
> >   Intel IPU2: Add firmware files (2024-02-29 15:24:23 +0200)
> 
> I can't find the respective LICENSE file. Where is it?

Okay, it seems you based your code on a wrong (not up-to-date) Linux FW
repository snapshot.

-- 
With Best Regards,
Andy Shevchenko


