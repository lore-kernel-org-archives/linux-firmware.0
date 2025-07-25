Return-Path: <SRS0=Ht0W=2G=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246ABC87FCD
	for <linux-firmware@archiver.kernel.org>; Fri, 25 Jul 2025 11:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EBD03C4CEE7; Fri, 25 Jul 2025 11:05:22 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32FEAC4CEF8
	for <linux-firmware@kernel.org>; Fri, 25 Jul 2025 11:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 32FEAC4CEF8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P8OgSH014961
	for <linux-firmware@kernel.org>; Fri, 25 Jul 2025 11:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bFo8OIF6M6NToiX1g+DGMwWW
	iQDUlF0EyALTc0/wZHs=; b=TWk+Pk/4R8bWsF3k/7DO2jq0F+FcjEUFsHZQnoQ3
	DRcgQahUR9ECreaE2z4jiguBvGWcIbepHbyvRjYmCKaj+zmsacbfUBG74dGeXJ9L
	dNeYzZrEfwFRQIRF51AzAdt2jCs1QzTeveX7E8OqYGbFu3SJ3NhDiu+EAIR2VXyr
	9GIkpdeATMjF6+lnxvtjYwEKFAK50MXldfz+SusLPefVAIC7+w6TUn82uOnKiEPa
	2MKww0/2eL++uA/hcyjAxxFczwgYRdvr+VAoP6KfsyKIgs2p69qBZKrqTlZHjtwW
	+/GVPhN17Nb1kZVT7ZbHn8HczIR+tauxHV444xyh8PogLQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2qhupv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 25 Jul 2025 11:05:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fb01bb5d9aso30934736d6.3
        for <linux-firmware@kernel.org>; Fri, 25 Jul 2025 04:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753441519; x=1754046319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFo8OIF6M6NToiX1g+DGMwWWiQDUlF0EyALTc0/wZHs=;
        b=EMHQv1iYyNYVMcGOTv9kPWcu3T7pcBMkgwb+fEu0lWpwdYiVJhUPLeOh7UycaZVbdc
         FBXv0/fHB2WeSgxuJEBwJ/0f9VLGKeGYsJrTxeJ48CkHamc7I3/6WPRlHcfdQneRBdPN
         zsM7I96w4C9g4HgLPw6l+r7DU7W4X2HEro/yTsrO6qGYn6dGYjRsxiw2WzaacX+rpWAp
         E7RR716PSUFmm9YQxA8BN4x9HXYqUTQCaRc1FZrKWtBTHqUhLI5im1z0STw1ZiQP2YWd
         VcvoDT17yZYs4NtWpNYbfiY5faCV8lxfI+9MbYGZsyN+4qOSseznA7BPFeAwkcrG+5bT
         5JPA==
X-Gm-Message-State: AOJu0YzQcheRMiwWlr9t9xbffkmmCqDwEi546XBpTvejCYw9YqpyzypV
	dERiaB2pDDylFZBmpMDxJwoefdEIhmVbQjyAu55iBVRNuzKN1cixSSTI/lrxBCSoS8Q4+tSAi0J
	t8W3QCBK0rbFTd1LTYA47xQFoJObueFtSpgx2l2OIl2VyYfYy2UcF+LYteiWkgjc=
X-Gm-Gg: ASbGncvo8eOwGHx22s0q7L4OURdcdA/x4WJE6FC9V8E8YfbQ9yWqin88YoDVpKbJu6v
	NL63QdWCH7MjXFlhks77tx8MMKmRIRf36DFwpUAxRB1PAVrJV6UeuJy1+R+ugC4rmm/Fc9Iyq9N
	nnteAGjaiRUEd/5HnSZO/psw358u8m3W2MyE8K78H27TCQexAmkvNlBDt48Mr1GbURPMUIxUMMD
	oKFe7XiAvwhqCwAuTJ8mU7snq4YbhyRacSo+VR3OhqcxWpoW4z5GlnUsy80tsprJYWM2nHCJx2d
	ZbgqtjAWdE73vERlWCt4pDDweb0fAxlB9w7IKqO6QcB603YgCL1fRusKg+6bNYgotG6CT+O7FCK
	d0LWRpnAuVRecT9yJ46LMAfScvSVUxHYh/+Gq0viiNEqRrmD3k3qi
X-Received: by 2002:ad4:5dca:0:b0:704:e715:3e8c with SMTP id 6a1803df08f44-707205d607cmr18219846d6.40.1753441518651;
        Fri, 25 Jul 2025 04:05:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFouQcNevSRIJNV/9DUbiFR/DILmOtdTAcjIrykcSgiz+dvcIQ/e/SAEGhc4tmamzHVD9sjDw==
X-Received: by 2002:ad4:5dca:0:b0:704:e715:3e8c with SMTP id 6a1803df08f44-707205d607cmr18219276d6.40.1753441517934;
        Fri, 25 Jul 2025 04:05:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b53c86bb4sm868536e87.151.2025.07.25.04.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 04:05:17 -0700 (PDT)
Date: Fri, 25 Jul 2025 14:05:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Subject: Re: qcom: Add firmware binary for SM8750
Message-ID: <i6vyneycavrhtwrolrjv23mg4z2wor22mkvsy7btzgpuh75vzk@zt2bvuiolgkv>
References: <060c5bc3-8e18-e7ee-2c97-695b198f7b7a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <060c5bc3-8e18-e7ee-2c97-695b198f7b7a@quicinc.com>
X-Authority-Analysis: v=2.4 cv=RbqQC0tv c=1 sm=1 tr=0 ts=688364f0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=9Q4W-hRGGdKvjESlt9sA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA5NCBTYWx0ZWRfX+1ck7Z81yMI4
 zPxSlRmJzw+Qih3UHHwnIskBM/aANspJbhLw+nAi2w+A0sF/G6E7kvWqtiLF5CLjCRO/63wv7M2
 6yYsSxTNj9X8TZPjsZXvOKKBZXfnXI78PT9iiB835Z2/3uCcL386OsZt0mGVPqV5AchEWzxK7be
 C8y15F1P6JAvsSYxclFL/7i2T95f+4v0ORs85b737AdImBjb9G37+1JmTdPPdTovdV6pAUTZCsK
 gRkvqGbA4s4ipnd4s3H33MZP9E/Ov9R8a5lHVUOAvh6oreFZS/8K3aBFh+4uC9MRd0ozo2Pr7UZ
 cz0lQtRKjLgc5CukyhHdqn92L/IX8CtnUv5Yn55iUOZtF0zrNWGonk/Qbl0DXekNPPUDfOfpA6k
 9PGPap9OtQvKppEZgbGfj7zg04byryaIqTtvKJg5d+B4M2LOyonyctCrw7mnKrM0uBWqsKHg
X-Proofpoint-GUID: TMJZNuLEOfRlXqvgRMwGX9HgjzOeNPKV
X-Proofpoint-ORIG-GUID: TMJZNuLEOfRlXqvgRMwGX9HgjzOeNPKV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=854
 priorityscore=1501 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250094

On Fri, Jul 25, 2025 at 02:24:51PM +0530, Dikshita Agarwal wrote:
> Hi,
> 
> The following changes since commit 25ea3ecfb5418e5674137a5442727128e23061fe:
> 
>   Merge branch 'amd-staging' into 'main' (2025-07-24 22:34:03 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> video-fw-sm8750
> 
> for you to fetch changes up to 530f283206034b20ed791ef379f4394ca21fe63d:
> 
>   qcom: Add firmware binary for SM8750. (2025-07-25 11:04:59 +0530)
> 
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>       qcom: Add firmware binary for SM8750.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
