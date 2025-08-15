Return-Path: <SRS0=bUS9=23=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF7FCA0EE4
	for <linux-firmware@archiver.kernel.org>; Fri, 15 Aug 2025 14:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0B4BFC4CEF0; Fri, 15 Aug 2025 14:13:02 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1F98CC4CEEB
	for <linux-firmware@kernel.org>; Fri, 15 Aug 2025 14:13:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1F98CC4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57F9lhoh010358
	for <linux-firmware@kernel.org>; Fri, 15 Aug 2025 14:13:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Y2BwE57hJ4PAm+G6Z0oxtjwpeqqQ+gCme+IGbgRZKg=; b=I46oRsA+XjBoHlnv
	kwjX9L76UxiWU+iXXLS7FYf5TWagmAV5uMBEM6Kczzv9AQ/SKQE2ukHnUsAwozXq
	X6sQkv+rk6YKNCelOLpBc25UaI41hTZtiwTIruGWQJpEBQq4P2kGNq/d67XriZHr
	EEOR6XGhTM+5TNW/2xBeSUvJ11sVDp2iUVTOGVSt5cxz/zrk4q14h4/H1nV5Ue+i
	FSNPOtOWRRm+2cP+KAhQIpkstrN5kWgAyeJBOeMhHXGge6gopWbt6c00FQD+FO6R
	nvpDIZm1iEfi4JYGwmp7/kbLmrPWHNfyNXEVkuRwzbwTU3cDg3Asl97vv/7zwck8
	TlUJxA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9t3efc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 15 Aug 2025 14:13:00 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-89018fd9126so3385171241.1
        for <linux-firmware@kernel.org>; Fri, 15 Aug 2025 07:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755267178; x=1755871978;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Y2BwE57hJ4PAm+G6Z0oxtjwpeqqQ+gCme+IGbgRZKg=;
        b=LWzAhn+Gjwtkd5VAcFudjLifJ3F4jjd3AIk3BK3hiRVC8FV5/7iaY9ptgZojY5ZBVw
         FpkYG5pW4SbmbaqvyFaas1/vTdP90geOdd4meDbLF3O1ayVTYjbfpxePmHt431mLAvy7
         H/sGVvB6reviP7tKbioPMdxbfHhq63XfipzB86jPzYaGiQM1f1ewwYOr4XZAS/uBhMsm
         oKT6lENqV0GKAG0nDzWm8UjVNtN8tzu/IIyIcQcwJoLHf2mJ6J+dCzVh19b7MgOAF4CQ
         cWhiX/kkK55qpaTjJD7LDd0XgF7bTJbvZXgQ5Nrqi1fxCsF+VrM83ktoCIE4oB+yhaTb
         8z5Q==
X-Gm-Message-State: AOJu0YzU1eWj11cX3fz71hbeJF3G+MyWWg94113WjcfIC7zRspKHCyna
	0W6j4+3wdJF/AYtckVe+Fiu0fuTQUN2Sol/nsdA7PFzDadGRY2j7JQe+zzaPZU0zGFxRaeemsVY
	Yiq4AT91+p1ZdK8GchfLnBmJcbb9PkqHhVXRHYK0qv6t9qwdYPTlrC6bQJuLImSX+1PkTD74=
X-Gm-Gg: ASbGncvDz0IQzZpC2oCi7fpFMKUR+R80W2jo/6Y+4wCUrShIYjqTGZjw86YnTuaeQmX
	t45sL6H2Vj5jF2Dj4uUy1AIKYOOaoP8MQ7EFl9XiRatcyULJIuBjdZU5lT4d/aoWaivzpWPUnfs
	iT6xShnux/tFC1PKXM7cV07kcNI7/RRRsKrZh5pd+X10GSILnBtEl6hhJIXGNIXIc8oUIRcXViy
	AXkP238JMlieindo2TZ2bXAumAKQ1Y/n12j3lbn5aOKFi4H6nyrz3xu4RUvipjtFV43FROz4h0s
	D+GtyA4XXTEuzTjyeiy9rKfOt1Wg/UFiMiVRoohVfc3tBdoTDbe0IEV6zhHAVsOzkfyX7ZxUaIB
	9yY9Y/vFJOfv2Yd23pyIggM/39ylW9Nr71VhJz6dia/8TziCVycHb
X-Received: by 2002:a05:6102:1621:b0:4fd:53e0:b522 with SMTP id ada2fe7eead31-5126d30fb98mr768104137.19.1755267178418;
        Fri, 15 Aug 2025 07:12:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOo3Qp5/LssG7ITWkuZky1df98F8mTVO48qW2XEUvcSAwZvhDju29tBTFPJqRRhEwrkteHVg==
X-Received: by 2002:a05:6102:1621:b0:4fd:53e0:b522 with SMTP id ada2fe7eead31-5126d30fb98mr768089137.19.1755267177947;
        Fri, 15 Aug 2025 07:12:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3f3c85sm301341e87.123.2025.08.15.07.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 07:12:57 -0700 (PDT)
Date: Fri, 15 Aug 2025 17:12:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: add CDSP firmware for x1e80100 platform
Message-ID: <koqfvbpsoa63vsziseqineugehgxy5mzwase2xmvfr4v6rao2i@yz3pp3wgxnez>
References: <c3f6d28b-c2a5-4b41-94e9-eb4e55a5e293@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3f6d28b-c2a5-4b41-94e9-eb4e55a5e293@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689f406c cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=66Dfje7xnP-rx7TblVcA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=1WsBpfsz9X-RYQiigVTh:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: 2eEx0OCJjozt3y3t3uDVdKSSoxDIK2ZA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfXwS3kvyJRmDpF
 aPsKAHe1JqnTae+8rnx1+mMPep/6ZfW8nvgJzrnw/NvusOCv6pKmtbzqS0hQZdtA/DeigjJ2uOO
 URqQIf/Lree7xZZafA1hid5skwzwauMRIAvGaUwYv6p53ViilZLnw4ersUdRE74pj5sVk+HrCSB
 yvGyiwZ0NGfmSiFod/YxaowvC+z/huP8PnX7VNiUx9qfuGNpR+mh++eeG4UG2m45ezMAOK+VqsU
 chQFEw77o0A9cw7MZGCfv1svJblK+7ZnMXliuBMFfLyNXKY89u6H5tUozRFiA/czIxMdfo+TcgE
 fQntQVdepIrZjzv6ADB0QKi+F7aZh7HcgFuZOfzxixm5LR/CpRFQnL2VB8QttwP4ht9nJqRYilp
 QWx92VsL
X-Proofpoint-GUID: 2eEx0OCJjozt3y3t3uDVdKSSoxDIK2ZA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

On Fri, Aug 15, 2025 at 03:44:52PM +0800, Xin Liu wrote:
> The following changes since commit 08ee93ff8ffa9e8caf2e048a47cdf010dd1bc12b:
> 
>   Merge branch 'amd-staging' into 'main' (2025-08-11 13:13:29 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> cdsp-fw-x1e80100
> 
> for you to fetch changes up to fec7a9678d1cab182d618ab5fa3919779c0e6230:
> 
>   qcom: add CDSP firmware for x1e80100 platform (2025-08-15 10:22:15 +0800)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
