Return-Path: <SRS0=L2Ig=BZ=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E03109C057
	for <linux-firmware@archiver.kernel.org>; Wed, 25 Mar 2026 19:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5ED91C19423; Wed, 25 Mar 2026 19:39:11 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 99BE8C2BC9E
	for <linux-firmware@kernel.org>; Wed, 25 Mar 2026 19:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 99BE8C2BC9E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFHMI0433827
	for <linux-firmware@kernel.org>; Wed, 25 Mar 2026 19:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VRX2TeJnAfqK61YrX26wKqVI
	j6I4aVlTC7JyT6LMrPE=; b=Jke5vlqLOymrsMkJIXGnGSKhUONpLkcA6PDaM0B6
	AWwh5Z9j9fz351ENI0ktAtJl9KNzS3r0sgSMlxlTMFnKsJyfimnyzbC87+2R7g1X
	YWqmDUOr3mQKoG9dUUGB2uXOunzALcWuQHF0wKSPtFtaXuzqkTlE96AWUVX6d12G
	cG+fBupcCN2s3QRBJEs11/xzCKxRT5edwla9jJZkTAhJf7pBdreCsiZ8RZ48Zb+R
	tcLx/TwMuT+WEYtIQFOoapxCo3CoV1gCpjbvBmxMnWqqyrczPcWvWxbZQI4mAx7A
	0mqGfuwWBd4XZGC/okK2znzqDlbwaQbnGt6QyslMRxsfnA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d41414qpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 25 Mar 2026 19:39:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b878a8c07so10711911cf.0
        for <linux-firmware@kernel.org>; Wed, 25 Mar 2026 12:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774467548; x=1775072348; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VRX2TeJnAfqK61YrX26wKqVIj6I4aVlTC7JyT6LMrPE=;
        b=Rw1qPPGyIjo5yLD1uO8XlDzxWXrMYxcAJrEJ04pRo3db3Xw167E6KVrEhfBecm+QSX
         sj1AwMwF9ynw3B7wmhS1ABYiQKmMT9bYXjLlMKiMnWHG+xEKj7nwRo51PzM76Rv3A/Z8
         fBIMfYD3tGs1xdf4/hwZpnov8KnxH+bBFZjaDLFBdkDvvlzk0qRtrKLhkPtLMUrZHKn6
         yDNsnrLgRcOIGKGE1YtmtTBhWrechjlZoOzqYrKvUObwNecr47S7VcXq58Tn11w7xj/V
         Es7/uIBrsRv41zTKu6XBwsQYuu/ZQSTAO+bixOuzEJajaic4yxPIvi198pFUqaiy2MI7
         UyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774467548; x=1775072348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRX2TeJnAfqK61YrX26wKqVIj6I4aVlTC7JyT6LMrPE=;
        b=gTa9uHx/tVxuOsHbkOhshCZjXTpeaLp/6EbAwK1mSCU0iE7LkNwzD5XjvFFMRveXYP
         wuDHIVIF7q3G9Kcr5kQNdoi46N8JuS10yvTvREsxbd32n7BAiBuo7ukhqnYZt1+HcWyQ
         WwULvBT+Ajy5Q9lec7WM+qDiCGHW5ipJITbIHWbr5rlTq459n1OHWIvHHAGtbSkWAAC+
         qG28mdBBDtqvH8/dBREYnlQG3y2YoWCyjR3mcdvQLpu5df/opO5eAMBQqELK6nsExob7
         hqTXHunsL8se4pxI+BhBSa3rlpTfcLQzZ2zhFJwdNO6gWzrvAfotLCfvZTjeKzcnyZ23
         3HAQ==
X-Gm-Message-State: AOJu0YxrxLtU8LCO1wuOGyTPOt1OAZ3RgNZcyMnxNgSqOuyeEaP0RoUO
	7BN+/C6wS1pwVxS1reYALZi/X3Mf3DrvDDaGBY4GrF6ds+x1wLbzfvkPvxsGn7L5jlVdJ+4gdXr
	w2ZQzn3ilFA5NeRpT0LcfP6Ew1tjI13QSTUYuPPn64i9frTKbKFkeW835lWNP6Pg=
X-Gm-Gg: ATEYQzzO0rWSFsiKGAJ9Kv2E3ms0PsIxFH1usG85xpCLzBGqMIT4YsU+Bgq16Ir33hD
	BVJo2AXXlJlMdK9QwxPCWoYtE+/u/TslYV/WiaAksiraYpFYhz2Sqsv31aAAE/vyEBUNCgNO592
	sBGOmb1mbPNFMeaFt/ss4Oz+Bo/dyN5HA71JfX65RMwUATJytF275ckwuSuOh66QrnWq+PIfp++
	5ABgSYuF5tcA1HjCxDETvPoR/SC4i4cYkFp6OjILhpRScogKuUIc+6JkQlo5u8rO6wDVM2DVS44
	cik8IurlIHXpb0jSLReaKnrgsBA/9gzswZnAhGMLuUblQ4SuX98VfvIb4FykmpEcPjp1nDTH3SS
	JfJTEMw1w1/yg7/MJA8YewUVvYHh6HGPWipnOfq9DgCZQFuqdj2KxaWa70POgUZzIX0YMN7tNyC
	QRKMJVQlcQJVb813+G9ePgwrj86X+IlmbQT60=
X-Received: by 2002:a05:622a:1f9a:b0:509:120d:4311 with SMTP id d75a77b69052e-50b80e66563mr73669901cf.60.1774467548238;
        Wed, 25 Mar 2026 12:39:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1f9a:b0:509:120d:4311 with SMTP id d75a77b69052e-50b80e66563mr73669501cf.60.1774467547795;
        Wed, 25 Mar 2026 12:39:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a068f8c7sm91843e87.65.2026.03.25.12.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:39:06 -0700 (PDT)
Date: Wed, 25 Mar 2026 21:39:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260325
Message-ID: <4zrp3tlsqytyuxau5qk4hnlsht24f6vlgv7pyhb5y5cswgn4c3@4imh6ktclmfd>
References: <32af006e-265f-4239-9b5f-be3d52996e10@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32af006e-265f-4239-9b5f-be3d52996e10@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c439dd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=p0WdMEafAAAA:8
 a=FOHEAjDUwq7NbCT47RAA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 4lEjoQtmwgfMpvUIjxO51fYMXLhuZayj
X-Proofpoint-ORIG-GUID: 4lEjoQtmwgfMpvUIjxO51fYMXLhuZayj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE0MyBTYWx0ZWRfXzGToeHhJk9Qu
 P8C5obAEjmnpd8fz0JK1/vhUSCZWBST0IhZqJLAoMcet++n3VHri2JRkCCuKWBok2wR7DqHfeek
 SIxF5E/f5Kq1yONXO3b+tZcftf9z51fiY6Sw4y4WjMb+mroTM2ZOGFO8pgMcGZJt7owrPb0wNJh
 fr/Qjq/CiQMe8Ep5j5iZGDvS1gP3koYWLndG1KBGzGbAggnYjcgNkzHIjmi0A1/uiO7ONBL/FM9
 dGqpJhhjQ8scRB4nSk5JwCB+MM9R4+Thys6P9SDrerzWXOQQFnfHgrpJ0ifFGfK6BuDkHNI4brc
 Q8nRLEYvap8rmXtpOoXUykM4DGv8w6260Il7eCBg9DCkTOLBvuNYTeMkBt0qNSZ+6zKkzvkfK10
 q1sNCxarNJmpWg6WaOup5pTmFXTZ1aXBqgSSsLZGpaJ9zBngBHjzW7M3v2i6xSa0rnsf7BMpwyw
 NNQ7NHN4f/F31bVIyDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250143

On Wed, Mar 25, 2026 at 11:00:04AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.
> 
> No updates for ath10k or ath12k
> 
> For ath11k:
> Update QCA6698AQ and WCN6855 firmware to address a WoW page fault issue.
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/974

> 
> Thanks,
> /jeff
> 

-- 
With best wishes
Dmitry
