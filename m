Return-Path: <SRS0=5Ed8=B6=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B88710D14B4
	for <linux-firmware@archiver.kernel.org>; Mon, 30 Mar 2026 13:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E627C2BCB1; Mon, 30 Mar 2026 13:37:54 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5BFD7C2BCB0
	for <linux-firmware@kernel.org>; Mon, 30 Mar 2026 13:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5BFD7C2BCB0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U9VlIV2953401
	for <linux-firmware@kernel.org>; Mon, 30 Mar 2026 13:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sSUQDqaqF8+DGsI7YP7WetVq
	6bXWgXt+wZGEBC3967U=; b=SM0qk1OKLzffGSy77QlFUzW+7kURmVirG8N1NOgJ
	fFk1zwE99PUSxEaiuieMW9awbgn03bOyfztg18gV+w1NSr6UvDmurVI4zvFwR9A3
	r+ZD0ERwHT+NGeEXch/yxbEp6lPE/GStQs4Alx90dSHpWIa9vlR510fj91iR+aIV
	DxOUgOoQXSo+561yeA/CWKLT6iRiOnwGnSrXVDq1CpPEJryl9rAVrUrsUj79Mw84
	ETg+QBTfDE7JMm1afpBjWskeG06vGgMtaayXkiY+iGMUiBGJsJuqBbZ7etJqf94r
	BroYOWuK+x4S9bAO2b4aXsmxdZhen3fnKpHzFNjmGEKT1A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqemaf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 30 Mar 2026 13:37:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509044f54aaso141562031cf.1
        for <linux-firmware@kernel.org>; Mon, 30 Mar 2026 06:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774877871; x=1775482671; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sSUQDqaqF8+DGsI7YP7WetVq6bXWgXt+wZGEBC3967U=;
        b=IacxAj5lNCMmxPtP2OAaD1R7uLpdWmvdV7Z+fxGhKhBBAQEjp7c3G1bfwAz4QpHezG
         5HMTVME5QC6WVkvGPbSL8dVvuk6Mumm0pEDmW5XWWsE2ziH/oSqLjgv2FujYKGTy78Mv
         6OpvafnMbzQgO1M6wIF4nV5A3RXpdolsqw7qAYVI7oj+wzXoyBY416ixDRap16eR8DnK
         husZnNvvJ+7hCSqc/r6b95p6eqc77C+GgiGJRzm46BMBtAoqPxjiwQy81CZi19LSSld2
         Go8M1bBkMKhiftCM4609N3pRBB+ybr5VX1+vEF3NVuqgDth6qTRTdM3KEMe9rbBiBJNS
         XNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877871; x=1775482671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sSUQDqaqF8+DGsI7YP7WetVq6bXWgXt+wZGEBC3967U=;
        b=ooqKd4sYYjUzFkkh2qxwU3o05cZvDaKMGk8G4BSF7ZYanfhHNL5xJbXoLLuMadE8Kr
         A6emAztMY61z/aceaBjbqCXUXxbfV02wYyghcvpHLTOwoyJwWyd3MVkbNUNrMfDX3Zvi
         xG7+sfay/ivXBpt5Aq6a/YqAIruMoe+++DiHMZdT+baw/25gLtk9QHo7W0XSLm+lMY3n
         M9hsKtafKKbc52t8kGO8UaVNTHavREGOWKe/GmhW/BWjVmHaclk9wtsXzfqqW8yoGJTG
         bCpi/rVeevaVMCetosXSZg2wO/lMYbSU2iiw+sB7uT/+bBcecXBabfHMaYpQT98tx/MO
         aPIg==
X-Gm-Message-State: AOJu0Yw9AMemHVdT8yrH9ZkktUKLeA1WQzDUTgAzYT2L14WVz6F7GGHQ
	ouFbhNMmXCsijF9ggebtz5OGZQs/Z+PgtrnLn1jjToa2KNvQkMpbSOoI9RRvh8CkxTKYvlTZgGZ
	pUipxfHyH1s5P/ciELjg9Di0kO6+fJaW+xgtYevDEn2dEuzXAHoT99qpVdgf6KsXS25gde30=
X-Gm-Gg: ATEYQzxzWon266gex8y6L660/RTXtVH7jZzi+/rFiY6CGs2QliW1o3LLLeZE4tSYNt3
	ha+HSTa7gitYm+mS3j0uF8bfj9DcBNZmG6w2BrESRdd6AZ5TlazbyEAZq9VFxtshYDV93Zb0dZ/
	g8PTtBjt6TEmhiwZEyZsALOns4gJNlhyHjz7h3vSQDLwZ+vvj/pUGwNoi4gDpTIhNj7bV2ui7Vo
	ppotvkwexqZD2S79RovN2b5zTU+e34pq9nGmGwpyAe7amQwH5iM84paqJTm4VollNKpaUOhqNlI
	Ig0XUB9YaGAFBkXbaUD5XjKLN522Z9fHuRRL/GnerhTL4vmrndU/ap1xlHe5VhTI4SW8Vyajn/W
	bVjTPPfy9EdC41O9HFmYmpeZRYhlXhEwUtSx1EjLwKbxFcLm8M0yxkrhkYKg6AHtENCtPlqpYry
	PEn6ya1xpiFxckP5Yku3i96xKsuvx2rRMmsrg=
X-Received: by 2002:ac8:5a11:0:b0:509:3f5d:4fb4 with SMTP id d75a77b69052e-50ba3816de0mr170026611cf.20.1774877871272;
        Mon, 30 Mar 2026 06:37:51 -0700 (PDT)
X-Received: by 2002:ac8:5a11:0:b0:509:3f5d:4fb4 with SMTP id d75a77b69052e-50ba3816de0mr170026231cf.20.1774877870777;
        Mon, 30 Mar 2026 06:37:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838dece4sm15421631fa.35.2026.03.30.06.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:37:49 -0700 (PDT)
Date: Mon, 30 Mar 2026 16:37:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus Amps for some
 Lenovo and ASUS laptops
Message-ID: <qmjjbrgwevacsyzd4hdflistgeaidmj6s3wsmbffuzs6utwb56@cmhjcdupatpe>
References: <002201dcc034$51468240$f3d386c0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <002201dcc034$51468240$f3d386c0$@opensource.cirrus.com>
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69ca7cb0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=p0WdMEafAAAA:8
 a=zgaTwN-Voux_VllGv4wA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: UyuWVECDwiWPHMhzmq9rgjxwf4PJAefl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwNiBTYWx0ZWRfX+Vc9aSf/tY1q
 AsPHi0An1AqWC6OcqDro+ctQ95Bocdw98lvmlnwx2GRcOAMkd+xp48O79wRI0hJC+3gVfT94CPJ
 mB9h1DIBf37k3FmKi/qXnYxDHB6di256mJM/Lc3mMCQBx+JjY9BCDpblyPlYMx3aMYaNPiyCcBY
 x6N2zs4PIP+jwAvPTl0VBey8ukTRDxO1aOS9X/ie3ExIIqA1QeCJyu3stkbXyxFhvR/lqiB2VwL
 QcXVhws7GIdcLNQ7BDmZIm+0H1K9juYDntodXaArJHp2Yq7Tgktef7gUdhL911JzRy4iSGPx5tw
 SzkJLNzGrHew9kGFBlNdy2BlHRTMKsGT/ggmaZe/N5b2yiA4MQHhg0bv7zF2xD7th0jM7Em4U4s
 JLNd9ihXdoAGgitehpu2OugaVMHGQYlDO9IoksCUi0dvJ69zz4uP1qf6oRQLT8+NzB8nnVE41mQ
 I08Wztr7P6dwkrEElWw==
X-Proofpoint-ORIG-GUID: UyuWVECDwiWPHMhzmq9rgjxwf4PJAefl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300106

On Mon, Mar 30, 2026 at 11:59:44AM +0100, Simon Trimmer wrote:
> Hi,
> 
> I couple of patches today - we'd like to add the firmware for the Cirrus
> CS35L56 and CS35L57 smart amplifiers
> 
> for some Lenovo and ASUS laptops.
> 

Merged and pushed out, thanks!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/981


-- 
With best wishes
Dmitry
