Return-Path: <SRS0=GITE=LR=linux.intel.com=sakari.ailus@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA821C4345F
	for <linux-firmware@archiver.kernel.org>; Fri, 12 Apr 2024 10:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 82BFFC113CD; Fri, 12 Apr 2024 10:41:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4D245C113CC
	for <linux-firmware@kernel.org>; Fri, 12 Apr 2024 10:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4D245C113CC
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712918459; x=1744454459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EtssO++bQy0Pb0Dq+UFwtq9tD+DHs7cWayNefYPoh2I=;
  b=RdcQf3Bv3lz+s/OVXFM6T1JhHSZKMsRy+9o3TfQnLvVchEe5gOvYcrNu
   6SpHtaZWrmzw7LQaKo62X2VkHBgTIss1hwNugp9w94RmQ5qvMFrTplepj
   O05Zcu3Hc6YbCTy1TIIbKIJ9HY478Up8sxBHYDYrdSaRmngdl63m9vI/X
   GESxa9ZGJGOOXD4b9bYh/f0OQL/RK/jdtHej77ynvhhsbCqkrCxsMf5Pn
   6mcrOtltoCjPpMrrYP8NGfMaSJA1XEQnz0FbYgTqjnc8bV0VE2F0/ExHO
   5Hq5BalSu2GrdCh/6DPzA7Qhm7VCQ476wgThFmXHl04Pr0gPfo3couSdG
   A==;
X-CSE-ConnectionGUID: QgSstaN4TpexK7JYcTVnGQ==
X-CSE-MsgGUID: p/eQcm8CQZ2PE0m/jk3mKA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8476934"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="8476934"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 03:40:59 -0700
X-CSE-ConnectionGUID: CtWU0Q5IRh2GMoIBOMZTKg==
X-CSE-MsgGUID: N1hx8YXHSnmaZQgzEf52tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="52169646"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 03:40:58 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8B57E11FA58;
	Fri, 12 Apr 2024 13:40:54 +0300 (EEST)
Date: Fri, 12 Apr 2024 10:40:54 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Bingbu Cao <bingbu.cao@linux.intel.com>, linux-firmware@kernel.org,
	juerg.haefliger@canonical.com
Subject: Re: [GIT PULL v2] Intel Image Processing Unit 6 firmware
Message-ID: <ZhkPtiIlQ5jXitGZ@kekkonen.localdomain>
References: <Zcx8i978Bx7QRSNJ@kekkonen.localdomain>
 <484e0f05-3332-4b97-89b7-74406677ed0f@redhat.com>
 <279f3b2b-701c-333c-e699-74225b4858df@linux.intel.com>
 <818a4319-bec2-46b5-8771-5d34236b351c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <818a4319-bec2-46b5-8771-5d34236b351c@redhat.com>

Hi Hans,

On Fri, Apr 12, 2024 at 12:30:44PM +0200, Hans de Goede wrote:
> Hi Bingbu,
> 
> On 4/12/24 8:08 AM, Bingbu Cao wrote:
> > Hans And Juerg,
> > 
> > On 2/14/24 4:51 PM, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 2/14/24 09:40, Sakari Ailus wrote:
> >>> Hi folks,
> >>>
> >>> This PR moves Intel IPU firmware files under ipu subdirectory for easier
> >>> packaging. WHENCE is updated for IPU3 ImgU firmware links.
> >>>
> >>> since v1:
> >>>
> >>> - Rebase on the Gitlab repository main branch. The one in git.kernel.org
> >>>   was not up to date. :-(
> >>>
> >>> Please pull.
> >>
> >> Just a quick note for the linux-firmware maintainers, no compat
> >> symlinks are added for the ipu6 firmwares since the ipu6 driver
> >> is not upstream yet. So we can just make the driver use the new
> >> firmware paths before merging it upstream.
> > 
> > We are planning to submit a change to add the compat symlinks for
> > IPU6 firmwares to support the downstream driver.
> > 
> > Is it fine for you?
> 
> IMHO it would be better to modify the downstream driver instead.
> 
> You can simply make the driver try the new path first and
> then fall back to trying the old path if the firmware is
> not found at the new path.

Something similar was done for the IPU3 ImgU driver when the existing
driver already had users. It was in staging at that point but that doesn't
really even matter.

Adding the symlinks wouldn't affect the packaging benefits of the change.

Admittedly I don't have a strong opinion on the matter, this should be
fixable in the downstream driver (which actually was my first thought as
well).

-- 
Regards,

Sakari Ailus
