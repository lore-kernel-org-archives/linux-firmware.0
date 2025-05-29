Return-Path: <SRS0=rPqq=YN=linux.intel.com=sakari.ailus@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF7AC54FB3
	for <linux-firmware@archiver.kernel.org>; Thu, 29 May 2025 12:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 48B31C4CEEB; Thu, 29 May 2025 12:20:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3BDAEC4CEE7
	for <linux-firmware@kernel.org>; Thu, 29 May 2025 12:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3BDAEC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748521239; x=1780057239;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mh6RHHhMan/A7k21LyAy3QL4/63Lp1QI4U9HcaqHFpc=;
  b=I8+nhBDKw4h7NbI08kYIkEZjtz3K4Tm7JGxzx0P3EYi+/zIupHFqTxxC
   v7H+Y1quKVdonhypEOOkokImiCjpkfkNh8nt3nXmlHyaU1Vd/JEQsrX7y
   W5WHDELilxryMDWoZXkxVn6fJ0s/igzMkiqdf1sZachAm6Csq00uSZNHc
   yqD3KnQcBd8BT+Zc3xkQmsWgFAvpoaAMxD8Cd/HD3mwtl9Uu0LYgTH19V
   G3ZW5dyhQubGZE/gqco4uHdHwRpd3MBZhouW9PM9R4Blixxn0n/K+povx
   FWOO1rgxbf4DVqrphmfnMsO6xGNtVbFEtPjGrbANqcxJSKWZr27cLoSO5
   A==;
X-CSE-ConnectionGUID: pp8A+sxHR2+tTIA/lFUrbQ==
X-CSE-MsgGUID: FKsWuWxyQmmqMDQ8RGl4GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50462964"
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; 
   d="scan'208";a="50462964"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 05:20:39 -0700
X-CSE-ConnectionGUID: bYHPc6U2Saes3BUXAgAEZw==
X-CSE-MsgGUID: O1mB1GXsSkmnzSP21SpDEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; 
   d="scan'208";a="148589163"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 05:20:37 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7D45511FC4D;
	Thu, 29 May 2025 15:20:34 +0300 (EEST)
Date: Thu, 29 May 2025 12:20:34 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: bingbu.cao@intel.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, stanislaw.gruszka@linux.intel.com,
	hao.yao@intel.com
Subject: Re: [PATCH] Intel IPU7: Add firmware binary files
Message-ID: <aDhRErmxVKpv0QKq@kekkonen.localdomain>
References: <20250529041531.3037707-1-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529041531.3037707-1-bingbu.cao@intel.com>

Hi Bingbu,

Thanks for the patch.

On Thu, May 29, 2025 at 12:15:31PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Add firmware binary files for Intel IPU7, they are for two different
> variants of IPU7.

Please see README.md on how to submit firmware files to linux-firmware. One
option is a pull request.

> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  WHENCE                   |  11 +++++++++++
>  intel/ipu/ipu7_fw.bin    | Bin 0 -> 266240 bytes
>  intel/ipu/ipu7ptl_fw.bin | Bin 0 -> 266240 bytes
>  ipu7ptl_fw.bin           | Bin 0 -> 266240 bytes

Why is this file located here?

>  4 files changed, 11 insertions(+)
>  create mode 100644 intel/ipu/ipu7_fw.bin
>  create mode 100644 intel/ipu/ipu7ptl_fw.bin
>  create mode 100644 ipu7ptl_fw.bin
> 
> diff --git a/WHENCE b/WHENCE
> index d17b2c41174d..d699bc6a9917 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -1287,6 +1287,17 @@ Licence: Redistributable. See LICENSE.ivsc for details
>  
>  --------------------------------------------------------------------------
>  
> +Driver: intel-ipu7-isys - Intel IPU7 (Image Processing Unit 7) driver
> +
> +File: intel/ipu/ipu7_fw.bin
> +Version: master_release_

I think you're missing the release number here.

> +
> +File: intel/ipu/ipu7ptl_fw.bin
> +Version: master_release_20250515_1232
> +
> +Licence: Redistributable. See LICENSE.intel for details
> +
> +--------------------------------------------------------------------------
>  Driver: mei-vsc-hw - Intel Visual Sensing Controller
>  
>  File: intel/vsc/ivsc_fw.bin

-- 
Regards,

Sakari Ailus
