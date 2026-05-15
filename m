Return-Path: <SRS0=vUrL=DM=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399AACD4851
	for <linux-firmware@archiver.kernel.org>; Fri, 15 May 2026 10:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 131EBC2BCB7; Fri, 15 May 2026 10:27:56 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E945C2BCB8
	for <linux-firmware@kernel.org>; Fri, 15 May 2026 10:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4E945C2BCB8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F52P8L3197594
	for <linux-firmware@kernel.org>; Fri, 15 May 2026 10:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7NXBiK1nP+6XdZs+AzXbAJeX
	FuqmFn52VfZw7QcGGkk=; b=LuRwDZkm4oconS1emRdjWsV8cWBS19Y4133ssjcc
	kLY59Tvx5KH3+HCuKGtF7/330FqDrZKc0e5vvLGEF7MUv7+l89Rn7fvEt72rmKHv
	A5h+Puh/RCsWHKETfRQjGnpDxmqvJypkBuXlZRBD5QD4NiD6Pyia5jORZZm4RfFq
	2LNszP007CWOBOnPSdZppKE6j9AQC1MmR2iGwkgkSwvWFifYQFIDAKur28i+u9oD
	hlbYWicZuUe0ktiORdBYR5a4PEuXY7db7cJqfpLpf1VVP83E/BADM/kSbdiJ5kOY
	koCApE+mlRhAW6dnKsHDBReLwJc+uY3WVakiKGgwh8iLOw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qau15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 15 May 2026 10:27:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50ff0bef198so184636531cf.2
        for <linux-firmware@kernel.org>; Fri, 15 May 2026 03:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778840873; x=1779445673; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7NXBiK1nP+6XdZs+AzXbAJeXFuqmFn52VfZw7QcGGkk=;
        b=WtXKsXx+k8Y42qRzXBmcvpJP2jku5CfKqPIr+Mj6KYuRCxD0lMHYuqlCjr6w/Dg0eJ
         r/pc4t5EsdjkHaXW6gSkRQmjG0tSO/N+Jnbnr7JrPVj1Gk0h1kV+vqb0Rm+60oR/0fSO
         7IMN9F+a2+LTFI0IcGT6icU04KTtjaS2CGK3UbYWdysxj9HVwzPo8iuzdFW3UHnYhVRQ
         UE7gHWc95BmDwmZr2UrzTeHj0V7oGsngtTR8Ff0fSzsuIP0+uweWkUx36CdYd/V6tRmu
         4csWHJbNUvMofcKPl9wsu6JsI9VLTFX7OAXRyVFXZOJBWeM9vS4ZyNANvxYe7yLrjM/j
         AYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778840873; x=1779445673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NXBiK1nP+6XdZs+AzXbAJeXFuqmFn52VfZw7QcGGkk=;
        b=FtZcl0LpwkNlZi5hJoRN0l6SQbLhS+/HWCfhaWuf+16UlxlJIJfzeL9t3a0abXasXo
         3k3Pok+WArf6rkohJ3gYyJLyDsjne2fMvgOyTRLhx8WBDjQKxSN22rL+MuSrRH1bfx/4
         KPpaY0ehgfcgEsamRKEGGikbfiDiGHwHJQITKUcI+J7xSupEC09m/Vhq1M92ybjDsJzj
         nznRucQfaukq6MCT9phk+4yayI+NkTB4vhOtyivOrZdR8nEgXz1odfKskhrJw/E9G+pN
         ++TVPAF1XvXeujkvOpdG9oCtpOxxZ3psnVpfSQxSMzGtRlg9p9ZPkajhIr7mDpTiNTts
         lzlw==
X-Gm-Message-State: AOJu0Yz8iH+phehLnkVAEkV+zW7HwWi4DNKNQREs4Udg+CCRSmn3Wf5Q
	RWQEnp6feQA9ZWWWZgUg9GCn+33Kf0cI/2ZDsYdrIUtLYPKSb28eDnHRkccNJ0YeCHM/BgeJbbp
	zASlZ0rK3xKl4RavGJonli/3R8A8ggqnr7UDoEx+PXuolDxhzSkBVGhNWfFDSBv/LH933mac=
X-Gm-Gg: Acq92OGPux6h2P7hbzhZhVyOnQySpmpcGyci1jYKCyFMnQsTT6ZMy62wWbB1FTp+NI8
	j+xAkVlFfS32u5mP9QqrGuWpF1ePWQ24a2NwmiXFUG3WcAh5c1Jq0+Npm/tGr35hZj63GG4ZAFb
	e5XMkOcQI8glCAZ+AIYBls8Kdo71Fwz3wrh6CCQ/0Z8saTDj6NrfebIUaKW9FhvDHQkjFdp/47T
	VZZGE45bfGWyl9XU+XRdXPphCM5OCrf6zS3HEL/a4jeIrPGQkIheuxIlp0dz9F1/OLLJnZBp9JC
	gBWY6mbFGl6nRVSCtge46Oou8YyQk+craLHnlPsGnf5R1GtWGDMya0/bcNQPL422hFwN9N45GxS
	i05/VntRAJLyg6Pn04lgvt80MWfiMFmh/AoSY8NT8yAcM7oEHNjETXoBAKhOCDIPYyJcJO/guOh
	RaFC2VqE+wtzCP2XD/5bRAkka5YNHwvnbi3hQ=
X-Received: by 2002:a05:622a:a6c5:b0:50f:b7f6:d626 with SMTP id d75a77b69052e-5165a219f37mr35655111cf.47.1778840873603;
        Fri, 15 May 2026 03:27:53 -0700 (PDT)
X-Received: by 2002:a05:622a:a6c5:b0:50f:b7f6:d626 with SMTP id d75a77b69052e-5165a219f37mr35654971cf.47.1778840873116;
        Fri, 15 May 2026 03:27:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a654sm1221949e87.30.2026.05.15.03.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:27:50 -0700 (PDT)
Date: Fri, 15 May 2026 13:27:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
Subject: Re: qcom: update ADSP firmware for x1e80100 platform
Message-ID: <m4lwysbckiikah7g3fdoh2twc2kjmrxul4pgv666ef4n3bt2m2@5husgmhzms42>
References: <bbf9ee62-dee8-4de0-a85a-3578cd2e80b3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbf9ee62-dee8-4de0-a85a-3578cd2e80b3@oss.qualcomm.com>
X-Proofpoint-GUID: yrEHDy9BcjgkLw0wXezw-zW1t1QMEqKH
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a06f52a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=qC_FGOx9AAAA:8
 a=tMm3SiK0Bocyj2_PMFYA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNSBTYWx0ZWRfX30ysPbcteOp2
 uF6gvVAcBdzXbBLM7CMNp8Ov6u/uXxDehOjkNoFEegJeCNkA1uwWVwehOCAclvOXc22yXCaWJwe
 1S+0C66u+B2gLABTfjYnI3cSxArT2hRdphyKSIVrz17FpcRC4gN3P/92nbODd6bnCf1A+wJs4OH
 mjFfUCocnvJoPi2sqOSE5tZiGqUWb6f4qE8KAL7DED51O5IMxq++PsdYFWar1Ozq5D1k2DNVr7r
 uFNW909rXZgT8dbTfY6O+YQIKvujQbrRIdFZUviN/u1/3RkcXN2tz1v6YTq/vJmm+ovNq8W50iw
 6hdE818PxA5TCCGgG1IYzq759/zpItONyBIoLjodfDcKLZJnmDs3EnrP2pTekCgCIgTPNw3igiH
 6+vlly8KjT/goWcuuKWFk6OsctEPetZGgG1AMCDKvylfxU9is2gJxShUIReTRnbVjy2iPMGdkQc
 5rCRgRXXIhVvzrr8G6g==
X-Proofpoint-ORIG-GUID: yrEHDy9BcjgkLw0wXezw-zW1t1QMEqKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150105

On Thu, May 14, 2026 at 12:44:01PM +0530, Saddam Patan wrote:
> The following changes since commit b3ed53e0cb528221d9e21b7842846c3ae3db7512:
> 
>   Merge branch 'lontium' into 'main' (2026-05-13 14:21:24 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-hamoaadsp839
> 
> for you to fetch changes up to 321c5c3195b8f2d39db1687186191ed099c16677:
> 
>   qcom: update ADSP firmware for x1e80100 platform (2026-05-14 12:40:13
> +0530)
> 

As a reminder, please update Hexagon DSP binaries ASAP.

-- 
With best wishes
Dmitry
