Return-Path: <SRS0=+kph=6R=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779B5D43341
	for <linux-firmware@archiver.kernel.org>; Thu, 11 Dec 2025 18:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3C462C19421; Thu, 11 Dec 2025 18:36:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4CAA1C4CEFB
	for <linux-firmware@kernel.org>; Thu, 11 Dec 2025 18:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4CAA1C4CEFB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBEPQlB2274180
	for <linux-firmware@kernel.org>; Thu, 11 Dec 2025 18:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=obGU9VqtTQRm/0Y+ywoX5NAn
	hSeTh7GhJp/EcjtpoCw=; b=DfljyhhzaQecbAqnO0vXqZEXIJdLmU1tCGZrYkrx
	h5n4YZ+PHK4TYwL9WmaONGXLZrbHFwJa4kabgp3/xEP6NF8ZA0eypDR9A6gqtUxk
	nxw4h9H2XaYiV4wj/JyYXDtOfH02xaKe8MeKLdPRQUfC+0HUPWEM7bwh5H/HmsXn
	4w1WtYJulWzEelR2AOnjTPWKdUAqk8Vbuc33X75rgwvcpkGh9Gtd1vjo7ORUn5fo
	iNx66WDtyRl6ecAea9Knz+LK+n7xleNqR53G9Fys+MIt2kIPWOvPpIlxNIuEJHvq
	Xyc/+sZZT0a/3fPXIgvqLPfJAyLljxs6aVKR3c3OxYPxUg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayt709yyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 11 Dec 2025 18:36:22 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5595f2366c0so440712e0c.2
        for <linux-firmware@kernel.org>; Thu, 11 Dec 2025 10:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765478182; x=1766082982; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=obGU9VqtTQRm/0Y+ywoX5NAnhSeTh7GhJp/EcjtpoCw=;
        b=guWE9VbxGEn8pQdP6TvlVMfNJRjS99ln2d8xS8m5xOYRU0YADGsLp40c2gljdXipfH
         jSH7k7cpRqQdOCpGsc3HfGNbLVYC5HsfGXXerk2ywzlpFOkXgwkhr1IiXpq9VIN6e/N8
         +w4tCZAsM2rjtQk40KiBy66iyd1fMa//4xFbfpiugCmNb39JbEIL3x5WhtDkpjrGD4pE
         l1Mbb0T75MZVF4Z0Q4vdSvYnARY1800rQUe4qNObdSyWvGHrceIdvdcSSsVzVMQMfUDy
         mK/Szb8X/9n36ntgkh13+DyuxflMGb7X9+kmNuYO+yprJrRZA+EeUwxas10niBl2K4Lv
         rrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765478182; x=1766082982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=obGU9VqtTQRm/0Y+ywoX5NAnhSeTh7GhJp/EcjtpoCw=;
        b=UH/LoQnVP6bR7TCDJUCi4Rfozkf4Y0ETeUZ5zDxemySWwaoYkofC2fm8bjk/V9PHQE
         jLG7Azc9Dq8zlk+4SDJmLecPd1jgDDYvURRrUqnNVGaFug24TvhveJZNo2R1MRtjo0Lv
         vZ2szuws/GOeLK6zjrcEscWMwWr4eqQ6ufwZVDI/vvBXfzA+T+9lpX3Ufu+zpSYCUci7
         cit2N5W83oFyQniMlJ/SuqDgITnJCG/Q0nngPzcJE3JMGWkIFImk7K+3pLVkvi9EOUPU
         4j+mfxwMX19t76CKcLtn2pN2v7UgltMv+XRNhNJ/boVdQhx1chezbmYeR9SlX772Fiit
         wS8A==
X-Gm-Message-State: AOJu0YyRer0OgLkxtnw76JCs7l6M4MtkIxlsJrfwp0sHgxYJW7CpnzV3
	GF0FnInk/lMBHe6dn1Cf9eDgqdAje/IG5fzNUHONVUFMI3GGUOcftpXpqfaPzUAUr652kLe/sFa
	j4q60YP6E9ujjgO4Em1l3ATHfoTXYGCkdX/NRXKeGdnXoxNDOG3cnOpT8ViIouCJIAuiTbfs=
X-Gm-Gg: AY/fxX44wK8rRNeV+moZDAlO+23X9ZrsDRvoNYPezhE1duwK9RwIXO1nkGcd/HocpO7
	7XElNYtPSIG8s0JTQSCAmk4kcoE4DZ91/vPtTIPTEdOrxfgxFvyVbH/6DNGRpm4dHD3OnnwLhu7
	cq7eSDUsorTMSW70JBd3FE/LtaIOk/a8uRayvZZ8MhUW5OPwjCZKa6MM19n3qiBmg5CMkCOLLxJ
	fNGkiFtm4S4BIUW6w+2TXqXh5ejqlViycXZ7MsxamvsGzChW6PIk0M4aPmAK5UDRB5DaGFywxxK
	FVOmQ5j+409d+684S4DmuhmS9E4JXrPZyaIhVwf+EAjKPl866C61ZA5t15OJqGkiFn3meEh/GWz
	u5x3jhUoQHnun7UEEST9Y8tdUvqgjtnSgXd33usPHTMxz+PBlIxBC0T37GuytvUDEiLYwR7RjUb
	0vv1mLwRrXlEgXI2u3NhX7iBg=
X-Received: by 2002:a05:6122:1307:b0:559:6960:be0d with SMTP id 71dfb90a1353d-55fcfc0039emr2655131e0c.13.1765478181917;
        Thu, 11 Dec 2025 10:36:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEeFgQLLgLqTkkUDdlDYV2X7lxvmUE8bPNUtutqm6f/yK3EsnM7LPKyx1mU0SRoitaTGzaOAg==
X-Received: by 2002:a05:6122:1307:b0:559:6960:be0d with SMTP id 71dfb90a1353d-55fcfc0039emr2655127e0c.13.1765478181491;
        Thu, 11 Dec 2025 10:36:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fbca7acf5sm8680651fa.34.2025.12.11.10.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 10:36:20 -0800 (PST)
Date: Thu, 11 Dec 2025 20:36:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rajesh Kemisetti <rajesh.kemisetti@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>
Subject: Re: [GIT PULL] qcom: GPU firmwares for
 sm8150/sm8450/sm8550/sm8650/sm8750
Message-ID: <vjdsapmtmyijaxjhpqp5pmfpv6bcl3u24wiiebenl7cevqmadl@xy43tpj3i427>
References: <5aea673e-c0f4-4f0d-af76-97bee75c2111@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5aea673e-c0f4-4f0d-af76-97bee75c2111@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDE0OCBTYWx0ZWRfX+rOE2EEaAtiY
 F86KNMRNv4+Frr2vwhO0dtmKJZ1ZiJKTKx2qKlS82NId9iYVkv3rIgLkSw3lO5I67zEotT4nvDC
 lphwDKH31nsdQ//yjuRRYfvxSk/r+ieAcISfxemrrWroESFc1AskFUm9IVkhv/US25ijTdKv4qj
 lqXFYLdede/0LLX/6MJK11Kuij6sTwzzDzmdynN4PeHxig9CUfkVW0vM3Kqyw5U0qWnxb+SB4mS
 v4BMr1ALQldUR7jbVXhLX/cjrpejkRtJdAxDKd9FJ+Sp3HDDINsldBGTBGE/uKR99mTRAwARkK7
 STFaBIml3JrHafjiTkEL8OFlJx3xXO8Dz+qx+eWsTKlmuqDKKxqudqZSgQNV7akydJ+4OWPBEcA
 sHOMe/D8h/zQJ80VQnD1Z3e46HLBgw==
X-Authority-Analysis: v=2.4 cv=WYIBqkhX c=1 sm=1 tr=0 ts=693b0f26 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=DnZRYP5fl5cDc7QaBMsA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: Mp8W1AglYov8LlmOKDo0sDThqBX0wUcX
X-Proofpoint-ORIG-GUID: Mp8W1AglYov8LlmOKDo0sDThqBX0wUcX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_02,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110148

On Thu, Dec 11, 2025 at 09:27:31PM +0530, Rajesh Kemisetti wrote:
> Hi,
> 
> Please pull the gpu firmwares required for Qualcomm's sm8150/sm8450/sm8550/sm8650/sm8750 chipsets.

Merged and pushed out, https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/820

Thank you, Rajesh, you rock!

> 
> -Rajesh
> 

-- 
With best wishes
Dmitry
