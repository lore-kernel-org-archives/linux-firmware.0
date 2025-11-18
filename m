Return-Path: <SRS0=fUOl=52=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9500CEBF9A
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Nov 2025 03:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 82512C19423; Tue, 18 Nov 2025 03:16:58 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E66D8C4CEF1
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 03:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E66D8C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI1N48T4166686
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 03:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DeZsXJrPEmelif57Bpf/IS5X
	M/T5zNoFpDC3W5jyv8w=; b=J1cFsVMFNrp6jujbh4QTJt8wXwqPn7hkHnZue2g2
	9wmNthiBwkFDq94YaPfkcK6jI/dWd4nxXswBy1v3GsyTbj6VehtlkCFgkMAgsP9Z
	0oSTw3G6drvHEmsP1q9AJSoLv42hou+rEE8lSyBhdHFlXU4NfFVRu4lma6+9W8lE
	jPJjOl9p/8fVAoAG2YY1TRBLHO3c3OBoxK27ussfR8LvoKDhQb5xj9fID39DJjEH
	dRaS2tTN81ltULNAOZnU5NvePq/s5Misys5nCuyZeTDBtshltpMm0rumU4JUhBBK
	RqdQecDr9HFWoiKcGonmBzf/T7Yc0B84rYSb/OoAc9g61A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag593t0s6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 03:16:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6ceab125so50712281cf.1
        for <linux-firmware@kernel.org>; Mon, 17 Nov 2025 19:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763435809; x=1764040609; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DeZsXJrPEmelif57Bpf/IS5XM/T5zNoFpDC3W5jyv8w=;
        b=fxqbyjeEW2kGENH3UVNf4Vq6jMpcO6bH2OnC86wBEjs5JQpejFsjvBXG0hsqzz3jWw
         C+ar7a8jo5EC3lhVskRtmDOf32J1le1k0RnAK2z+8zn8LEh2s1WU5C/TA/VO/5/AIvDu
         1UZVgcukV7mZtvvk7oM4LE9tXCaqMMEg5FYk4uvuiDxRYTzVn8lWdEexWKFtrOUpyaP1
         J3iX+h4o7ceN+j6s59/tSzp1yQBsGn3lufLRYpZGl2qwlXbuUoSGN91KiQXDmJH3+n/N
         B7hDehr1FjZbys70KrkEKG6XQclNubXdvISxoJbap6Kh1J9LGtVX7g3ogueYd8H4VqRa
         Yu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763435809; x=1764040609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DeZsXJrPEmelif57Bpf/IS5XM/T5zNoFpDC3W5jyv8w=;
        b=CgGNYYmdk9yoxZQgZTU8aKhQzP0RePq6k2SrjKvj3pjcEy3KE85D1SpVwOueQD6QT2
         N86W6gE3V57zjLBe3cHyfJ1g9c3I0AmZE6Bn80nU27lRLQGamJkx43McTpqkttoUnDFF
         bP79w+4GG2AIVoENyoTkzL2OnqSyG1+hGjFduEc09zlsRo20Z66HOZQctADarbUl/0vO
         jWGgKCfwF2nd53Yt5pSZCl0iYAyrFhGakWPhkZOaM3rDJJDYQ3inX9mcz7DDdGssAR60
         9KUYTzcalCnS7tdLoc4Tzx1vNJrx/SP082STzIRjvqF3T7+2SbVoxBWyZp/hGCsu9/9A
         4wag==
X-Gm-Message-State: AOJu0Yyr//cCa32lwEPE1nXHEVKYFIXutGOct1K50yotDUcrO+zk3Zy1
	eyl1u/UcsAxVmYMh5+TdpwFTgBNisnQeVkKHg48eDWS65M+WNhnPn5dO+ugtWum+2PBKAEaNUjV
	JwI4oDZgVJL1BYnjV5hWGoAB0gFlDCFM1HPaoocfL+ZjC4D8KtIf1UAK9AuRMsS0=
X-Gm-Gg: ASbGnculI1EoTqEGbZkWgJn81GjSwN7y8iqanZjYhq7oyvV7D1vRX6eYujtZuvcPlqL
	CY1IySSjXmuZdjGQVZHIG4+29kWWhoPCpCTnaSBpMES3LZ9X9qaZMWq1KDb+Tt/MIRLMBcdF6od
	/1jruCIM31CVWA8+GS0LzdFLFCkqYNjg1tzGTVcW4OkJrocGxOS5WgUowyOdcE30+xJ4Q9BuLnl
	3CknHevrAD6DvjT8E5T0ZkhppRD+yG/LbrmtlK6IfizjrYTAxTarGat5c44FscrIzyDhIFnwNNy
	cua3r8eewonuE8guL6fPmydG/TnzOumgR2pQi2ngerySbQajGG8wvGj8ztyuC9/1GHISmLR9dYS
	94KOvZmKJxRmZCSFbgKdP3NByQnGQfa9RHEq9DMMKrSImyX8kZpF/SK1MRxlsjgjeGD38NdV7/7
	e7gKebtQQODtI1
X-Received: by 2002:a05:622a:1988:b0:4ee:1472:9998 with SMTP id d75a77b69052e-4ee14729d75mr143694961cf.12.1763435809140;
        Mon, 17 Nov 2025 19:16:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGW7yJv8DQX2tKIZZCvLbzX8N/F+ETOvLGJRsZU4+bqsT6pquo+kibkZVIHKXnlQ+ZIL833XQ==
X-Received: by 2002:a05:622a:1988:b0:4ee:1472:9998 with SMTP id d75a77b69052e-4ee14729d75mr143694761cf.12.1763435808652;
        Mon, 17 Nov 2025 19:16:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580400458sm3651849e87.63.2025.11.17.19.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 19:16:46 -0800 (PST)
Date: Tue, 18 Nov 2025 05:16:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PULL]: Update firmware for Qualcomm AIC100
Message-ID: <bogyn24u6367tzkop52ffylkzylwjlyzwu6f6pcydpo2lrcr2r@pvzkjmfmplre>
References: <13afa249-cfe4-4c19-96b0-ca9506b2fbd5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13afa249-cfe4-4c19-96b0-ca9506b2fbd5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=691be522 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=JKYLkXM4sJaxhMPzHrgA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=poXaRoVlC6wW9_mwW8W4:22 a=pHzHmUro8NiASowvMSCR:22
 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDAyMyBTYWx0ZWRfX4Y+9gKCzu8ds
 5o2YjV/kn4heCxDp/vrja5NDRCQJ6VfxJTuNSKwdv0XITr5rOn9Jk7NJh1ARbzsDpxJZU/VxV58
 adQaemeHcHNVFZywM8EC4OTv+c4IqCcKSZ/ngemDTU6nB5n1CoJ0jxpZypvoupLWVn5FbDhPg2E
 BU46t7IHP7AX3aSLmb1niDCJtDV3oGObxyuC4mRm880t+T7JhbrTY2PT95eQ6oqOPWRkSkbFGuR
 RlDLARtIgkjEfrdb4QxgfgOl540QpbxOi9RBY7a/F+bMc174804UU8BS1NlheuOxnYq/oJfq458
 AqE+THWi42l/O2t0uCL9v5sW8d31GwESirRPDSi+OSIj/aPQp+u/M5LIG3LRZXw6aukQVl4liba
 rtJutbIzPABUso3n4LYs7qrxvpSOnw==
X-Proofpoint-ORIG-GUID: AjDn6PQGuav0abYLooHPEYtlSiN8xnvr
X-Proofpoint-GUID: AjDn6PQGuav0abYLooHPEYtlSiN8xnvr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180023

On Mon, Nov 17, 2025 at 01:03:16PM -0700, Jeff Hugo wrote:
> The following changes since commit 43a0c8df58aebec0a9456fd5ff4ef955c627d0c2:
> 
>   Merge branch 'mt76-20251117' into 'main' (2025-11-17 17:42:57 +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/quic-jhugo/linux-firmware aic100_1_20_2_6
> 
> for you to fetch changes up to c710fdbe961e6e04239b989d688aaf56cb6d90e2:
> 
>   qcom: Update aic100 firmware files (2025-11-17 12:51:53 -0700)

Merged and pushed out, thanks.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/786

> 
> ----------------------------------------------------------------
> Jeff Hugo (1):
>       qcom: Update aic100 firmware files
> 
>  qcom/aic100/fw1.bin | Bin 2180920 -> 2180920 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)

-- 
With best wishes
Dmitry
