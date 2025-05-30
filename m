Return-Path: <SRS0=/JGp=YO=linux.intel.com=sakari.ailus@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2D4C5B549
	for <linux-firmware@archiver.kernel.org>; Fri, 30 May 2025 08:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D566C4CEEB; Fri, 30 May 2025 08:30:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 46232C4CEE9
	for <linux-firmware@kernel.org>; Fri, 30 May 2025 08:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 46232C4CEE9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748593856; x=1780129856;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6ZWQcG3vpd4JsnBFOkvYwdyqcXaIj7Grva4ERmhSZ2I=;
  b=n7YUs0g6y2d1OEGfgXjQqw4czqCzXkyPhRh7NZ0xgHfO2f6Bk55i8F4a
   5+QE9FDkd9yKT7CWTrMQsnIpR3VlLyw6VKNqpz0O0zS7PzNUF7UfARyxI
   kSAOEFFQL4HoqnWqUPaoXnRXtr2v/7B0rLpiemWRxPKCTmsTYy0pImrft
   T4Q2ZFMcL6MQvG2fVuKTN1NjKd3G2ErNJ8r6H29tsYKmjAhY6IsnIEfaZ
   wQP8egjYKiJnBo7K85/IlYPYoAVCOt4XzmGFRrUjGhsYkQzvo1xMeiMFU
   ldpvu5/YAixWH26vOex3+nXnbjxGWBYDdLAmD9p8Oflqlu1pjNp+7vECo
   Q==;
X-CSE-ConnectionGUID: 0wrG+bWoRyKbPYz1XzjcHg==
X-CSE-MsgGUID: AcDuhIKfRxeSSCSaZIzayA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="62024634"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="62024634"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 01:30:54 -0700
X-CSE-ConnectionGUID: +VNexjZhRyW58qt7fqpuzg==
X-CSE-MsgGUID: v/Qx7aRQQLiIRQtqO3rz0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="181032269"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 01:30:51 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3F99611FB1B;
	Fri, 30 May 2025 11:30:47 +0300 (EEST)
Date: Fri, 30 May 2025 08:30:47 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: bingbu.cao@intel.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, stanislaw.gruszka@linux.intel.com,
	hao.yao@intel.com
Subject: Re: [PATCH v3] Intel IPU7: Add firmware binary files
Message-ID: <aDlst9cVCn49sGvp@kekkonen.localdomain>
References: <20250530023436.3433326-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530023436.3433326-1-bingbu.cao@intel.com>

Hi Bingbu,

On Fri, May 30, 2025 at 10:34:36AM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Add firmware binary files for Intel IPU7, they are for two different
> variants of IPU7.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>

The patch as such seems fine to me but as I mentioned earlier, this is not
how patches are merged to linux-firmware, largely because reviewing
potentially huge encoded binaries isn't useful nor is e-mail suitable for
distributing those binaries.

I can submit a PR.

-- 
Kind regards,

Sakari Ailus
