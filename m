Return-Path: <SRS0=RY2e=AA=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DD1D2FED4
	for <linux-firmware@archiver.kernel.org>; Tue, 27 Jan 2026 18:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9A089C2BC86; Tue, 27 Jan 2026 18:36:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8E133C116C6
	for <linux-firmware@kernel.org>; Tue, 27 Jan 2026 18:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8E133C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RHVuVe1268748
	for <linux-firmware@kernel.org>; Tue, 27 Jan 2026 18:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ixa2UGNOFQZl7W2RGTX0PTpp
	eOqrnnMpuO5g8Z9i7aM=; b=fcl/VH3HO+yP94XAfGovsWpacnxdbhM9txSHE4yC
	9goskpflG6mtq3dkXu18L2niM28yWp4YfCHMktg3PcvCjYDFlB3r26lykEscqVJS
	+gmwNXcIPSnFe11tvCEMqR9ulpD/f4/kaIJIS/ymZh1EL6tpt3iijR54o1p5NVOx
	4QmwJd3+vZ1rLTxeYk4Yt3jYQuC6G27WjmLU4DRHjuEjxWOC6Zi5XeMhN5mHdF9E
	XzhyRe9VAN6KkyADozZfiTMUvHq9sR7vu3L/ibvhTrK3jWuPyiwGFjGDPOmvLZZs
	moZwT7rD1jRxWYK49qRCh3OWywvBqzngqz4mwhVcphmolg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxnyatwsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 27 Jan 2026 18:36:20 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9483af29f38so5606258241.2
        for <linux-firmware@kernel.org>; Tue, 27 Jan 2026 10:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769538980; x=1770143780; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ixa2UGNOFQZl7W2RGTX0PTppeOqrnnMpuO5g8Z9i7aM=;
        b=i4z94Puhn2bmidzjNnvN8GIZDtcFj7XMqumI78b0z0NSGvALv5lnZiUnhGvuxagRcz
         8XQP2Laq3B/bGQU137wwmvWgbLHTSFaX2LknfNBv6T2m8pCtx7tgXLa1RqByN8OMoolr
         iP6FDaYb28Eaenoyckh9ja8wAMQBzCNGfp++X/O46O4kDKYhkS5jLhN+3vcjbzjFzVxL
         eRHKtmxJh23Lm4mRTCRG1yrtkl1IPq6+nU6ZWfYy4Eo6acQx9947ArdIq9G+ncEfEQ9n
         CNIGFPJ1+kxVYEW0gJsAxLY4uNK2s9cjM38Od/HdtQpofmfJh5kxc+mxgP0muadotY/W
         4SPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769538980; x=1770143780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ixa2UGNOFQZl7W2RGTX0PTppeOqrnnMpuO5g8Z9i7aM=;
        b=c7mc1o2o17rUFffaHJdHZlB4SZvz2UV7OPwY1MIBj2KD1gTGK1iJcNhMJ48OTjfTpR
         F1ivTFMRX41YjROSBIUP2QJs9/IEJFWlpuDVT3E9ihF0UEjacVt3a6zpvPkt7Xw0dsd1
         yEtEB2w/dRMtEnE/Pd9cF2aAzvMPhW1dFRAi3yLzCAd3Kx0ONraupxgXlrLATL59HuBI
         SaaGRlxWGY0JmYYoLOUanYlozo9Jr/eN6aVzjZb9ExQIIiYLFnT1gi9qFrNCRlTg1O2T
         ysohJ8aavrL8tewVL3u04BEQXrCUUubT/rDxzLlYdpIrQlYCnlIV4iJ0XINzSo4AoaH0
         kztA==
X-Gm-Message-State: AOJu0YwI/WSIZUkpMVIeOzxOKPTGTtzos2lpRgDq37JlJSbVtoHcS8Ed
	xOB20WaqBSp+FXmSQBkUDBQeBB/VP1jXf4z250nWBM7BUhhvj2Xool8FmkKKF8ztXA/uahq3vym
	CpxMEG3rMcxNAVskAHo9nvt7mwic0YsnDju3v4QtS7NJiJ12lrWt1Irr7SG0FwS0=
X-Gm-Gg: AZuq6aJc2gmaiSyjdjFb/z3ZhCbKHNHI6wEESO3q5ScngEBofbjv5K9V3dH8ZqbpnxM
	EsxhtaWWlmdA+PREpccRWA2ek7XiCm33XLo6vsPcBew8sMzkw2mcqLUAk/BlphUmbP5y/2aYA2H
	h0jY22bZME1pxOVwt8QBLioColZ38S/mWn7MUpBLcwhgdhuWrMR4PRkj/zdXYDO4BjGzEdQENQa
	zoyRAuEH+QkA6CEJPyUIm7pIlP9soJUq4tCYbABWtyxeItdcSp7QHyb//15/ejHpZhvYvwlca/6
	WW7bP0YVqb+ufCEaxaeYwBunHKUvtWpEWuLQ8IlkXgIjBQeWuzAxIcqckycR0719w9DrPC2gYwk
	5IA6YyuwFmhinrmaAwFiNiODlSm/NZcldAbUhUHAaz9O1qSK7OmgkXy3agd7x3KgFFhl9CINRr3
	slVFo1qSsML3lML+47n/OrN7A=
X-Received: by 2002:a05:6102:a47:b0:5e1:866c:4f8e with SMTP id ada2fe7eead31-5f723817ee1mr912476137.39.1769538979645;
        Tue, 27 Jan 2026 10:36:19 -0800 (PST)
X-Received: by 2002:a05:6102:a47:b0:5e1:866c:4f8e with SMTP id ada2fe7eead31-5f723817ee1mr912467137.39.1769538979095;
        Tue, 27 Jan 2026 10:36:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e07481b72sm98670e87.11.2026.01.27.10.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:36:18 -0800 (PST)
Date: Tue, 27 Jan 2026 20:36:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260127
Message-ID: <usrawtmodalbj4b4i22tk3hzgbrpt3gdbji4x7vfzdhp6qsb3g@rw2bl7jdnp22>
References: <6f1fa3be-e28e-4653-bbf6-b0b64b7e65b2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f1fa3be-e28e-4653-bbf6-b0b64b7e65b2@oss.qualcomm.com>
X-Proofpoint-GUID: A9y8mIjmxfIX_0KwbVk182z4CeXcD_nu
X-Authority-Analysis: v=2.4 cv=JZqxbEKV c=1 sm=1 tr=0 ts=697905a4 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Ic6Kjyy2t_iG7cYfer8A:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: A9y8mIjmxfIX_0KwbVk182z4CeXcD_nu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE1MSBTYWx0ZWRfX4koU/cz17SsZ
 ZdRddoBx0O1tjP/7StdSrZTLJNDJedoUhaj4BPi6UtZSdO2Ve/jJxrIimEf6c7xezvUfQJJLwvL
 ZqvwV5Cc7JvvSoHhQgb1JERmYMx+dtLqUAxgjpd3VknjHkSa/pxg6YzZlHtZKEoEyr+RvmWRAn6
 BY5iFw/g7SxLmHzsD36C2oLhm1T6e1H3hn4nbonWHS6aKmJRS6NWT0m1K24NVaWBeisiPhZnwk5
 YCiadcAWqkG+b9zvH0vEwbt8jRnLutsjSykN8FWkaaTOU7YSyuI4HpEFnBjo+J+8LHxbOAVLasD
 ddcOhADC9ytJhbz18cknb3F7RIKKwEtP30Yg3JC4t26DmqGObcWnDr06vVbm4w1ZKyaIHlUFSkL
 uhVpLkYSLGQAL7mYQznIM3PE1870YA3Vn+CisSaOLOqexf9V417/2MbnLXgmKOt4M/KAx6qKphN
 1uXkwUC8aLMWEgjNH9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270151

On Tue, Jan 27, 2026 at 10:04:46AM -0800, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.
> 
> No updates for ath10k.
> 
> For ath11k update board files for QCA6698AQ/hw2.1 and WCN6855/hw2.0 to support:
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=255

Don't we need the variant for this one? Otherwise it's too easy to clash
with another unprogrammed board.

> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268,variant=QC_Hamoa_IOT_EVK
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride
> 
> For ath12k update firmware for QCN9274/hw2.0.
> 
> Please let me know if there are any problems.
> 
> Thanks,
> /jeff
-- 
With best wishes
Dmitry
