Return-Path: <SRS0=/GBh=WF=gmail.com=maxim.cournoyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4F3C282EC
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Mar 2025 14:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EC1E7C4CEE3; Tue, 18 Mar 2025 14:58:41 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3B8BFC4CEDD;
	Tue, 18 Mar 2025 14:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3B8BFC4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so7070639a91.3;
        Tue, 18 Mar 2025 07:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742309916; x=1742914716; darn=kernel.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XhU49ujeitFLBDr/sphCaA2x2P+zbzSecWbJwh9Wt5A=;
        b=A5tAu+K9Vr1A58/6Bd/15a6Ocb0WwGQ7QIkzYw8ukBSzK1gLQNd6Bpsw07nlH3+PcQ
         jXs1OMYIEbVNg7MX1osCcJ/+NXI7iQk/CmipvnPgatYgYv5LxNKsM7lzf8AOaErw/ptn
         tYHfVBZsoXT1NzPNsqvJzM9C+vNNkpK1oOf5gwpiGT3rCkKG3qVxeCNfRQqZtPC5uRyE
         iXOKI5zEMTmPiGOLuP2t9lwlZ9PynK89Elvq+9jBlkb4marXRcCp/K4r07N7DZpprtrS
         nLsQU9v/PD1sWW3s+znIIcmdjre8A3Z8cibnzJ66Pdr9DhRXhZj1amY+BHu8CYmeyDVQ
         pBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742309916; x=1742914716;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhU49ujeitFLBDr/sphCaA2x2P+zbzSecWbJwh9Wt5A=;
        b=fCyb8ATnkCmxzGYTdAxpmq0H51cQ8sWsQIxbn5CODD0Q7bcdjo3XZtvkZA8mv9Glvn
         hPIOqYF6eQdRYJX5QzsEaaOAWVHB1FwDcU8B5GaWYLkDQ2+E9qaS0QP+8ISb2spCYY45
         VXkQxSPyt+DqZGdbJkOQqfBvankiWBhxM9Y4IDHXQ5gDB2kumAMeRpPuWFt5kLZu2yg6
         V7ZFvD3znRZ5UHHcutc7iqIhMTsI2wOn5s7scKndG1IC9uQH4DZThx3UCYWTbR2iuHR5
         zYsHoIeFSwZQDnoCGTxWAxVrb8yPkbZM0WU1k87Zz0N5ucFTPthr1Np4TQY8C4LkkYnf
         3dsg==
X-Forwarded-Encrypted: i=1; AJvYcCWCOZOB6Od6LoXVkhnfBsQ3Bp0BLfrW2Axh1VCA1rjaBZx+Ecfl5l0xtRV/T20ANAsnEzuCk9qz@kernel.org, AJvYcCWTergayNaJ4xaGfZZzegPYBXfsE6MqhYl2u0ObifX9Sf+FOf9x3F9hjpn5NOdpskwcNWG1I8fhpA3vcjgfgAc=@kernel.org
X-Gm-Message-State: AOJu0YyximA9fXSsTdwUdPrjLbvjU6pOtDjsibXPmi+xYd62GUMaj/R1
	B01QKteLBWOQqIbDCcmKvGE+zaqmJu3VhALuATq9AWYem6+s5BwlP/dN0GxD
X-Gm-Gg: ASbGncvKdRuitqLysdwijMgYJtdhOp1J/C5HzStDt+e2MOTco308wVlaoG3dKkKbeMq
	qCnXjSjI7YU6KBunL/VcFFpEn8L1b/DdcvO5lHHMZgbjUYsB4oIBAa4fAHA0x1UN/J8gv/1ysLQ
	8M46OSVU64uF5qZNPP96tOUxWQnEky2+4cxIvepdXNIF+jVuT+WxXSBHkVQxJi9Nfm02B9rHzGt
	gnWZb8OB7zaL+o2yewc+D3w2tm/RVpExTXilrp9vGASMiIcZ6eeJBSdVqsUsTC5BHY1rsZ6OW7L
	E8oRjYg+UyByHuRl/4B/hspxjY4LzT5xFQhspv3CSh0=
X-Google-Smtp-Source: AGHT+IFVi5vSiohLI7pA2xghPuP01+YWlrwLHZAnRYVclnFmzjgceGCu0zuyqCFIZzs5cNPD8o3yYQ==
X-Received: by 2002:a17:90b:4b83:b0:2ea:7cd5:4ad6 with SMTP id 98e67ed59e1d1-301a5b92817mr3411201a91.32.1742309915885;
        Tue, 18 Mar 2025 07:58:35 -0700 (PDT)
Received: from terra ([2405:6586:be0:0:83c8:d31d:2cec:f542])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301536320d4sm9211579a91.30.2025.03.18.07.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 07:58:35 -0700 (PDT)
From: Maxim Cournoyer <maxim.cournoyer@gmail.com>
To: Timur Tabi <ttabi@nvidia.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "superm1@gmail.com" <superm1@gmail.com>,  "jwboyer@kernel.org"
 <jwboyer@kernel.org>,  "linux-firmware@kernel.org"
 <linux-firmware@kernel.org>
Subject: Re: [PATCH 2/2] copy-firmware: fail gracefully if moreutils
 parallel is installed
In-Reply-To: <f5beca4503c46772ad65a8485757f0c700b0192b.camel@nvidia.com>
	(Timur Tabi's message of "Tue, 18 Mar 2025 07:08:43 +0000")
References: <20250317191606.64181-1-ttabi@nvidia.com>
	<20250317191606.64181-2-ttabi@nvidia.com> <87h63qyh4l.fsf@gmail.com>
	<f5beca4503c46772ad65a8485757f0c700b0192b.camel@nvidia.com>
Date: Tue, 18 Mar 2025 23:58:20 +0900
Message-ID: <87frjatmgj.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain

Hi Timur,

Timur Tabi <ttabi@nvidia.com> writes:

> On Tue, 2025-03-18 at 15:42 +0900, Maxim Cournoyer wrote:
>> I just rechecked; I don't think this currently work, it'd require
>> complicating the script to accommodate this less featureful parallel
>> variant, which is why I had opted to use GNU Parallel in the first place
>> :-).
>
> Like I said in my other reply, I think you misunderstood the point of my
> patch.  moreutils' parallel is still not supported.  I'm not trying to make it
> work.  All my patch does is make the function run more cleanly.  That's why I
> said "fail gracefully".

I see; I had indeed missed the point of your patch.  I understand the
problem this attempts to solve now, thanks for the clarifications.

+        # The moreutils package comes with a simpler version of "parallel"
+        # that does not support the --version or -a options.  Check for
+        # that first.  In some distros, installing the "parallel" package
+        # will replace the moreutils version with the GNU version.
+        parallel --version >/dev/null 2>&1
+        if [ $? -ne 0 ]; then
+            return 1
+        fi

Instead of checking $?, it's better style to check the command directly
like:

--8<---------------cut here---------------start------------->8---
@@ -22,8 +22,11 @@ warn() {
 
 has_gnu_parallel() {
     if command -v parallel > /dev/null; then
-        if parallel --version | grep -Fqi 'gnu parallel'; then
-           return 0
+        # Moreutils's parallel doesn't support '--version'.
+        if ! parallel --version >/dev/null 2>&1; then
+            return 1
+        elif parallel --version | grep -Fqi 'gnu parallel'; then
+            return 0
         fi
     fi
     return 1
--8<---------------cut here---------------end--------------->8---

-- 
Thanks,
Maxim
