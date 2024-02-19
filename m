Return-Path: <SRS0=VlhW=J4=linux.intel.com=sakari.ailus@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00E1C48BC3
	for <linux-firmware@archiver.kernel.org>; Mon, 19 Feb 2024 16:04:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 68F3AC43394; Mon, 19 Feb 2024 16:04:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E402EC433C7;
	Mon, 19 Feb 2024 16:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E402EC433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708358655; x=1739894655;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+ZyxrI0IBTx5ff/UQUZbQPrY2F1F6uBiWbcW3qONzJY=;
  b=nRudZTIXcSeBb6SPTprOFde1bW72OS0KBOG5xKe8XutfFj2bizwN9kbJ
   6QZHI3VQkX4DuCrvi2LV8E2q6KX+8iIR0C0fZfy8KfLSYtYaTQH+txb76
   ksGGO48NFFTPHcH/NmDQUCnOR3cuthTXtNWKhu4oOacA9HozXmB52fE9r
   NXtDzjO0a/gmJ0cMpPZynWN5y8ZaP4XeX0R530a0xgrjeiiV48epzSMhW
   KdkFVjPe6p2D+VmFK4sEvt6psR/w2VC36wSZ8CQxYy64ib+6ffPn+SLFK
   Y1Y6ZHd3Trn47y12BFMMa6YBNb3Qc+d9mzlFpXpr5HIeCZSylnp6djde8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2306202"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2306202"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 08:04:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="936308192"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="936308192"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 08:04:02 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id AB0F011F7E1;
	Mon, 19 Feb 2024 18:03:59 +0200 (EET)
Date: Mon, 19 Feb 2024 16:03:59 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Bingbu Cao <bingbu.cao@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [GIT PULL v2] Intel Image Processing Unit 6 firmware
Message-ID: <ZdN775n863NcZZvf@kekkonen.localdomain>
References: <Zcx8i978Bx7QRSNJ@kekkonen.localdomain>
 <CA+5PVA5aYOO5acdfjgcXfqTgBh-ZWwyQuYEE+9oORvVjZhVR+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+5PVA5aYOO5acdfjgcXfqTgBh-ZWwyQuYEE+9oORvVjZhVR+A@mail.gmail.com>

On Mon, Feb 19, 2024 at 07:50:10AM -0500, Josh Boyer wrote:
> On Wed, Feb 14, 2024 at 3:40 AM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi folks,
> >
> > This PR moves Intel IPU firmware files under ipu subdirectory for easier
> > packaging. WHENCE is updated for IPU3 ImgU firmware links.
> >
> > since v1:
> >
> > - Rebase on the Gitlab repository main branch. The one in git.kernel.org
> >   was not up to date. :-(
> 
> There was an issue with the machine doing syncing.  It's been
> resolved.  Apologies for the inconvenience.

Ack. No problem.

> 
> > Please pull.
> >
> >
> > The following changes since commit 8acf0a98dbe1606cf696b0ee61bcce7eed5db80f:
> >
> >   Merge branch 'robot/patch-10-1707787255' into 'main' (2024-02-13 01:31:56 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/sailus/linux-firmware.git tags/ipu6-2024-02-14-2
> 
> Merged and pushed out.
> 
> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/152

Thanks, Josh!

-- 
Sakari Ailus
