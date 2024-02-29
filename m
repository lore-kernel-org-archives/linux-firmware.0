Return-Path: <SRS0=TIE+=KG=linux.intel.com=andriy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141B7C48BF6
	for <linux-firmware@archiver.kernel.org>; Thu, 29 Feb 2024 16:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB008C43390; Thu, 29 Feb 2024 16:17:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E1FFBC433C7
	for <linux-firmware@kernel.org>; Thu, 29 Feb 2024 16:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E1FFBC433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709223454; x=1740759454;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rVWIH8fRUCKgOBheHOOTcfQ+xYGvMy0HNCdt4l3+VLE=;
  b=VBQkQjOHq4JUbx83/9dEYcFer0JorvARvVr/RuNmIY26ra3Ke51FHHaY
   K4UUkd/bsUPA4Me75hH3kPQ2NKmzezy5hmCNGgxfvyqyib0GiYq1FHh96
   LDiYPdTxo8VGHmIP/CobeVNIthxpnv9jiECfUKYvPdkjNCdMgVGMZEdwm
   51Z+7Cqd+R6OPtTpt3Pa1KpAcrUWuWEZeoXTiivRwnJ0RY0gCw49z5aQJ
   pkSOQuiw27e/oZwdItu7ilDIgtMHSWW1iBpA2m4eBszCjIm0153qC+iNe
   EocHdEQ3k2d7P4FQtyY/oscheJBGEHzseVNwnFdHVzzPydY2D+3vGuVL3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3573302"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3573302"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 08:17:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="913985750"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="913985750"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 08:17:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rfj69-00000008iZr-2Tq6;
	Thu, 29 Feb 2024 18:17:29 +0200
Date: Thu, 29 Feb 2024 18:17:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-firmware@kernel.org,
	Bingbu Cao <bingbu.cao@linux.intel.com>
Subject: Re: [GIT PULL] Intel Image Processing Unit 2 firmware
Message-ID: <ZeCuGbjjcmqbqSFM@smile.fi.intel.com>
References: <ZeCGEN8PgbkY3k_g@kekkonen.localdomain>
 <ZeCP1y5RZXAXBTEB@smile.fi.intel.com>
 <0224ee42-d13c-469f-8bb9-7367fea54db5@redhat.com>
 <ZeCXnteuUAByCveF@smile.fi.intel.com>
 <e9b7aa7c-04ed-4373-8935-07e45e58ee9f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9b7aa7c-04ed-4373-8935-07e45e58ee9f@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 29, 2024 at 03:47:44PM +0100, Hans de Goede wrote:
> On 2/29/24 15:41, Andy Shevchenko wrote:
> > On Thu, Feb 29, 2024 at 03:17:26PM +0100, Hans de Goede wrote:
> >> On 2/29/24 15:08, Andy Shevchenko wrote:
> >>> On Thu, Feb 29, 2024 at 01:26:40PM +0000, Sakari Ailus wrote:
> >>>> Hi folks,
> >>>>
> >>>> This PR adds firmware files for Intel IPU2. The atomisp driver that needs
> >>>> the firmware is currently in staging.
> >>>>
> >>>>
> >>>> The following changes since commit fe0274513384acb3be3756ae17da97f551a1e0e7:
> >>>>
> >>>>   Merge branch 'robot/patch-0-1709160821' into 'main' (2024-02-28 23:13:23 +0000)
> >>>>
> >>>> are available in the Git repository at:
> >>>>
> >>>>   https://git.kernel.org/pub/scm/linux/kernel/git/sailus/linux-firmware.git tags/ipu2-2024-02-29-2
> >>>>
> >>>> for you to fetch changes up to 28fbeb4f8b8cf5fa214eeaa93c83d4ee779d7a5b:
> >>>>
> >>>>   Intel IPU2: Add firmware files (2024-02-29 15:24:23 +0200)
> >>>
> >>> I can't find the respective LICENSE file. Where is it?
> >>
> >> The license file is here:
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/LICENSE.ivsc
> >>
> >> And Sakari's pull-requests is based on the very latest linux-firmware
> >> code from: https://gitlab.com/kernel-firmware/linux-firmware/ which is
> >> the canonical source now and the kernel.org repo is a mirror of that.
> > 
> > Hmm... I don't understand, but when I went to the repository via Web UI I
> > haven't found the respective LICENSE file.
> 
> It is there, but the directory entries are sorted in some weird order,
> so the LICENSE.ivsc file is near the end of all the LICENSE files,
> no idea what is going on wrt the sorting ...

LICENCE vs. LICENSE, but still I aware of that and I was not able to find it.

Whatever, I just tried again and it's there. So, I haven't remember what I have
done precisely, but obviously it's on my side only.

-- 
With Best Regards,
Andy Shevchenko


