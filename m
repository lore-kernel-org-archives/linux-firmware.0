Return-Path: <SRS0=URVO=CN=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5D7F9D0D1
	for <linux-firmware@archiver.kernel.org>; Tue, 14 Apr 2026 13:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C0F9FC2BCB0; Tue, 14 Apr 2026 13:54:00 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C83B5C19425
	for <linux-firmware@kernel.org>; Tue, 14 Apr 2026 13:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C83B5C19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EB9mJV363068
	for <linux-firmware@kernel.org>; Tue, 14 Apr 2026 13:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ToFhSog4DMKsgOAUx9tBjdfM
	HW7nNsljmk9Q/5JdAVg=; b=e93hmoOV9qSrXS/088v8qngrHgIyA/c/oB5AtRPr
	dMpOO9SVZXO0zkUWW1AiM+gLVz9+sP0UcuvLp/c7EgH51KVCcuLv/TcafkQFULEY
	T3dBB35TT9Z+yReuFskWuGgE/OmV+IMVQsY/lMhyoZKeTHJnksn0VvmF6LBUtuh4
	ijK1PefG/7WSkvubxtZ0LJmEdYfb62h6jE3ncIB1H+uamVRhwK223Nl6xYpsoMOP
	+A2qv+iG9HBWJhZAn59bJ9L35nrjS9UVWfD2vP98BO+n3rveqrH4jyKKqOFWzz8d
	JsqYUg/ZMdGGy2jjt7uyeWL7Ok09gJ4PH80MEw5Fg201Jw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870ty47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 14 Apr 2026 13:53:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d812c898cso144364571cf.1
        for <linux-firmware@kernel.org>; Tue, 14 Apr 2026 06:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776174837; x=1776779637; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ToFhSog4DMKsgOAUx9tBjdfMHW7nNsljmk9Q/5JdAVg=;
        b=R+Y+rtwPr/QjW5O5DKtBh51JrJa65dK+uVMIPP+xwDOhcpkwL+Dr5xep+wW9p/lWqb
         /Sb9Hhs2LVJK2DiwYT1DE/K6bWrpMQqDZCTcWlb7qrEcrdkcrx0Az4Glongw6Fej1MN3
         5LP56uJa83Nh3zpsO44vWNzWW/+UpO54gvuWSbwY3gwWBTtuiZ7bHQkXcrkdLAyPhws5
         6KjXep2ThmodG7Ds6WLCz9HJHN46ihxFOYjChGHcmuXvCmXW26JMpuHvzF/yfjk0Lxje
         P7+F49DwGobWgsvr5l2yiSOgAdB+4Z7dCDGFH82dK4S54LoCxYLsgL0d833NL6vozW4/
         GbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776174837; x=1776779637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ToFhSog4DMKsgOAUx9tBjdfMHW7nNsljmk9Q/5JdAVg=;
        b=Bn1TQccFqHVjE9oLUBwb/LsRR3ZnlWxI/R504HdMRc+GVOEMvpUotgnL15cP8LsYZV
         b8c0nM8YUO5xqIb1gpkKXMZJBIubDPWKXbW6yDDtBYOJkk415b3eWJV9apmFavsYQMmb
         JLeG5uue/NhYciYKVns/FuB/0E35tXHwoE2f5VNC2j0JKT2KVEqlL+FGOZcxIXJkJcbs
         3iICbye9nnH44Zkz8VJEkV+c3IAL/i+1a9hdX96CRe4zFlqPZ3H1y4i1Gm7MIAcQFrKr
         5GF9/8dapCvzfq5ixHPFiMiLDf1Mr+VsmxOlZvl+ydrXMFut1qLOu9zrZouNbuiVP6U2
         25AA==
X-Gm-Message-State: AOJu0YyHmaV7LhGPCoqe/n3jDvv1dlGy49VL10DkTb3O/GAdN817j24a
	TcZ/SfmHvfFnkUnvq+jyqbsT83/VlzeEG6/LAkmBcdF2C/Win0nI+gqBfOicrjHxAbS2EFFcqDk
	RnQFEU+gH6otYrjSxW8xQFPqTX/iiFiYn3jnGTWf+xoDsYfrCVc413XuaH5ph92Q=
X-Gm-Gg: AeBDieuFoRF1epZK+idT++8gbQ6fiG4QFywOTYxmu0d8cYn/NRQ4vmZthz0EQoiSwbF
	4nRtYlNAzu6W45QrOnMM5UbBfIS3QXXyxSZLL4Ty3TgilMchKpVtuiJDOTgUxoVUBcvSZFj6ENc
	BbdmxqHr6dL6/hW1YcG7c7JH1rjXQX+dyujPnEK8JZLd8OpJlhEoqH5LKtAJeTuL4JDHoPlcUDF
	Q9L5By9HrNBdX+juIUx7nJU1hDZ2ix7F0FBolKTYDPedd7RLma+CcODSVW3kETeQ46R0MeQjczp
	UqiiRuadgghqFtcpFRhmpzPNU2IZySNbh459V65kLD7jWReUvNBTvjJpDURz2h5RtbG2zfrdPkS
	AdL43fkT8+fYZExZ2x3bKCiCW+kaMeo6v21pkULdQQv9ungiBuWYF+cb1/VUUc6+z6EDprg4SiH
	UKln1uaeLPfFPir2YrMTNQD+VEKrVs9c4SfNiDxAZlOsUPjg==
X-Received: by 2002:a05:622a:1915:b0:50b:6a79:45c5 with SMTP id d75a77b69052e-50dd5b775d5mr273848871cf.22.1776174837000;
        Tue, 14 Apr 2026 06:53:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1915:b0:50b:6a79:45c5 with SMTP id d75a77b69052e-50dd5b775d5mr273848581cf.22.1776174836583;
        Tue, 14 Apr 2026 06:53:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e4957eb57sm31042481fa.36.2026.04.14.06.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 06:53:55 -0700 (PDT)
Date: Tue, 14 Apr 2026 16:53:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: Re: Update ADSP firmware for qcm6490 platform
Message-ID: <ziqpoazcfqdqug5bvmrt3e6mruqg464gkrpy33dfum34qslqzm@aana3oxydaqt>
References: <f53aa2da-c1c3-498f-9ea6-22763592f429@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f53aa2da-c1c3-498f-9ea6-22763592f429@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=C9vZDwP+ c=1 sm=1 tr=0 ts=69de46f6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=CFOarWZRRspKLdFQQqAA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEzMCBTYWx0ZWRfX3bIe0h/kXrVD
 Jou/rGhGmCBPAKi64bbIbeRkj3zr6NtRkY/Teq/4EuGfQMLc/0d0siiRXPxq0W++fQ8StoqBeLC
 gZ67beil/BoDTh4pH4peNTChGxyxZBi8mXTr5M51BRa/wLEeUsgpSFiA0kmOLcb1EeGdVNjy2Os
 XTGFCQgraDhNyTc35nGDiNP3NLFBftFTPG7QqapokKMjIWR6bXCwzcP7IotvzW7JM9CRpC6jfEK
 hvT7aA4kSyxLHaV+4WMN608U9LfGtOzqCDeJA1n/lOtWmSTVCO9MZo6doI4O0LjHnA+0Q5TwwL2
 86BUZOuvb/xpUbt2vJDBCMyH/t5Rm5n9V2kAZYmjEFjmd8kn2laTT3hTKgyUtUrg5GWItRAlDz9
 M6HvFoytgFFFxwwQ8Mrh3PfgF7AG7wFGR2kTsDtFdj1lpIIXDLQ146ErIAm7W0x1JuC1/vsLJNe
 lvEi4DIPYgot2ZfJgXw==
X-Proofpoint-GUID: 5u0KtV_HP9iv4_UjB6Jl3YMPVdwrE9ot
X-Proofpoint-ORIG-GUID: 5u0KtV_HP9iv4_UjB6Jl3YMPVdwrE9ot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140130

On Tue, Apr 14, 2026 at 12:12:14PM +0530, Venkata Kota wrote:
> The following changes since commit fd6ca010d42dfeef4d510def2edafe907bfd1ee7:
> 
>   Merge branch 'amd-staging' into 'main' (2026-04-13 13:37:22 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> qlidspfw-kodiak
> 
> for you to fetch changes up to 4bedb0e45e8256c1a0be900c981dc239b6820ed3:
> 
>   qcom: Update ADSP firmware for QCM6490 platform (2026-04-14 12:02:10
> +0530)

Thanks, merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/997

> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: Update ADSP firmware for QCM6490 platform
> 
>  WHENCE                |   2 +-
>  qcom/qcm6490/adsp.mbn | Bin 12095036 -> 12099132 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry
