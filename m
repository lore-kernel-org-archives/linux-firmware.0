Return-Path: <SRS0=L1cX=DJ=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8660CD4F25
	for <linux-firmware@archiver.kernel.org>; Tue, 12 May 2026 15:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B98E6C2BCF5; Tue, 12 May 2026 15:35:39 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C9F99C2BCC7
	for <linux-firmware@kernel.org>; Tue, 12 May 2026 15:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C9F99C2BCC7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CAkZlY739995
	for <linux-firmware@kernel.org>; Tue, 12 May 2026 15:35:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e8GuDILYYejd7408kw8tpP1y
	NVhdju4T3LQbeGJg1Sc=; b=Tpbot9OW3+goUKO392IJu89qj53VW/y99XN3BpMt
	0Cwiwo5m5Pc4ezWKKBU/ZrZyKNIW5vx2YX1MYBiP+VWrosIBc+R8QWndYDsP9zyT
	TtRHxn7duy2Hn++Ml1Tc1YwfikPXxaWJscC+Jiam81YNz3wpc5SEN6ma0zlM9V9W
	bRq3zDX8BI8u5u7UpzDs5leiqUs+/LnjF+yAMP1iiQFDJQWf9pVjNd17SLkqNfdY
	QLdvbHjoLQm2kOWjaJ3JFMjSXJME0aR2T+mjaBfN8NpPgPpW26kp7KTKrWpWBKhp
	68nUrP20BBjPgWDy/MAxgEHrblV9RFI7rXK6FAYWCKDISQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e42rhs72q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 12 May 2026 15:35:32 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-63209622b03so1419023137.2
        for <linux-firmware@kernel.org>; Tue, 12 May 2026 08:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778600131; x=1779204931; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e8GuDILYYejd7408kw8tpP1yNVhdju4T3LQbeGJg1Sc=;
        b=ZKaHoV36d9smUL7zW5Z6qBvBJpkVEgq26dyVmOEBIAhnd0lziBBPoD7F1tRYPCZuHh
         MFpofPtli3q/QlxXq2eeXqrFtzP/Vn1LgT6GgtEK9a/Ni4Wp4bDyIra872ch/EW7+HTf
         ejaMI+DhYQxsfhOWAxCxNpeiqsYmrVrVZWxSayZ+jSAIhU3bLL+EC/c5auYlEUKe6AcK
         L89RFuql/uN1KHS9thffDd566zMZHhzY0cX+HOVEQwG3L0AeESe6ZzFDBkSNM8g6iARC
         SF/oZPKWURrZU42iKmcZaxqW1RGwdstbKxXPTx2GYa2Kkw7PAohYsHpBKkpaADbsDxLD
         P44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778600131; x=1779204931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8GuDILYYejd7408kw8tpP1yNVhdju4T3LQbeGJg1Sc=;
        b=Wpow3hqj2IvuwBjtJu1+rDSb1sLMz5e0XfXqWEv48nYpv3vooY7O6fHF/Xh6QcqyDN
         FQ5dr8Mfio084EGWHMdCl/X8x01s/IeaOznXuEdDHo4Jq4QVKVttfal0UieDeNf7dLDG
         ISwsh70Iaxb37j0o7tXXY0mIq6nzMhVx9R+PRJzOOmnW4jVW0zYYsRctT2wRH1ny5tNL
         cHAFdiZ9E+1FB7ptt4OUt5OUobf4NQ6RVAcRSAjdbN569PA/cZQzqb4rDSmRiHMFvr+R
         iAMJrHTjYtvShRREtsjGZvBmGNnjvnSy7F9zGCEeYcXqLunMQhgHsIBoF5i1W9KLusJZ
         Z1pw==
X-Gm-Message-State: AOJu0Ywq2b4zqm3BdAkdZdTt4Ju4HBqdWOpv6n/xqEuheRf8tBX0Y9Qn
	zlW55YO4S56pl9uIws89u68mvYplv4z8fohe151Rwo9D+o5hZ1n81AI7Jo57jZ+eEqqYZQXDVS/
	NQI0smlDTGrSQDl3+0/6gpJ5VjFWJm5ZpCRYFoxeORJz6ZYxuIn0iAc6GwlZxXO4j8UcG54g=
X-Gm-Gg: Acq92OEXnlqKDMS/fcBV9Xrb7wZvJt/X6ApWwCrYu21zc2Cr2ebdxo9V4pTnPJTLrr7
	U4tu+Uj53+F8bexspnw+kk7QAZ/jmQvZZdfLt3PqUpCmkvt2Ud068F5aVMGafCMCT89eUEVkyvt
	rLKk8+bFzic7ZSfQhP505fpjUvythn9JRZjOpvK9VG6Mt5mzr6IggiPXLBBWZs9NBIbs3J7FtyB
	n96vRGITkvGbExrDqb7wj0H89i9RGY7UONX68UGg3hISjs5vUHscBdVd6+Iku8CLle4ZFKMfJH6
	qBcVdjuowJnzWcVlOJ3st7bXZVVBc0cm2AamzkYfOFcDPfEFh+893VQh9JiiXfHP64BtAWLlvV5
	twkrXwRSN5M6AjNm1E5ljGqHMoHPa24Tx5PAkSZr0RzYG1kAviqISjzg9R6EmESLF9vkuUCaGiK
	1I73Rq93EcDrxfl+grvaPdv9qId2DqHVnaxhk=
X-Received: by 2002:a05:6102:8091:b0:635:1bc8:3568 with SMTP id ada2fe7eead31-6351bc84075mr2954866137.23.1778600131377;
        Tue, 12 May 2026 08:35:31 -0700 (PDT)
X-Received: by 2002:a05:6102:8091:b0:635:1bc8:3568 with SMTP id ada2fe7eead31-6351bc84075mr2954822137.23.1778600130887;
        Tue, 12 May 2026 08:35:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f614a5f4sm35586241fa.33.2026.05.12.08.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 08:35:29 -0700 (PDT)
Date: Tue, 12 May 2026 18:35:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com,
        kssb@qti.qualcomm.com
Subject: Re: qcom: Add cdsp1r.jsn for sa8775p platform
Message-ID: <xfmj6boz5a4lbu2lvgnpmrikjkfcbgbog7ue25bo5medqbe25v@zidc6g26ukza>
References: <2d982640-1f8d-47e1-b626-2e40d69eba98@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d982640-1f8d-47e1-b626-2e40d69eba98@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE2MiBTYWx0ZWRfXw6dw52anAq/P
 5149qbB8sRhvFMOXLzjsHzUCy5piao7PqbVzaIXp9LpfYStv20JC+LTk/FXcFOO+tAX5a5ta0Fx
 wGh9RyV2LybXh7p1mb9iVIMMceLW8gQGbWa35J+APqlMKnz0orVFi2n5hMTP90CYSM8lc8+cTCu
 yuJ/YAgv2lmKo8TjEJnSpgKCnCPRqEBw6FkxH2NwEwqCXQOYVos5fOV0SG4GY6i9rfugpbhvixx
 AJCSvzgc+DiLWx3N+Cm2CbIwKW495eEymvdtkS8jp+cOR4F1qGPY0AnUbh2V64bJWi1/OyHw4Hl
 8L6DQvsR+xbbuFWr2lgU3SNMQcDQ0XncUP/AmJBNfwkTwFfNqHNPbobGeYJglhMXOvfUSoPVLKI
 7kQyP45TqM0DMQNcg0xAhS/MpoLjQARjcRXVmGKwe4PdeketNfo/l4zFXYZrH3VWUYrCHbGN9Zu
 AUpRdHtZPutwv4giqdw==
X-Proofpoint-GUID: 8XnV94WkpU1vUg8tPkAJvkUauRpiWVvm
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a0348c4 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=qC_FGOx9AAAA:8
 a=uaS1HuCJY8nxEruBHskA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: 8XnV94WkpU1vUg8tPkAJvkUauRpiWVvm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120162

On Tue, May 12, 2026 at 07:30:28PM +0530, Saddam Patan wrote:
> 
> The following changes since commit b965e85c15a94974d4a6390972fc1cbc1bb109cc:
> 
>   Merge branch 'amd-staging' into 'main' (2026-05-08 18:54:42 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-lemans
> 
> for you to fetch changes up to 6a81adce2fbb4e281a7508fffa76f8fbeed79996:
> 
>   qcom: Add cdsp1r.jsn for sa8775p platform (2026-05-12 19:08:11 +0530)

diff --git a/WHENCE b/WHENCE
index 3a88a751..34abea5f 100644
--- a/WHENCE
+++ b/WHENCE
@@ -7040,6 +7040,7 @@ RawFile: qcom/sa8775p/adspr.jsn
 RawFile: qcom/sa8775p/adspua.jsn
 File: qcom/sa8775p/cdsp0.mbn
 Version: DSP.AT.1.0.1-00196-LEMANS-2
+RawFile: qcom/sa8775p/cdsp1r.jsn
 File: qcom/sa8775p/cdsp1.mbn
 Version: DSP.AT.1.0.1-00196-LEMANS-2
 RawFile: qcom/sa8775p/cdspr.jsn

This is the strange place for the file. If you were to keep the entries
sorted, then cdsp1r.jsn should come after cdsp1.mbn. Please correct it.


-- 
With best wishes
Dmitry
