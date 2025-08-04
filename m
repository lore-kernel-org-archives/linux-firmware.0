Return-Path: <SRS0=E2Fr=2Q=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F410C87FCB
	for <linux-firmware@archiver.kernel.org>; Mon,  4 Aug 2025 09:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E089C4CEF0; Mon,  4 Aug 2025 09:34:05 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 137AFC4CEE7
	for <linux-firmware@kernel.org>; Mon,  4 Aug 2025 09:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 137AFC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574972WY002587
	for <linux-firmware@kernel.org>; Mon, 4 Aug 2025 09:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R0EtB29QCrGU1mZ3zkMd2RvD
	gUQ/9lb/W4SaXQGmHBU=; b=USUJmYxOr3I59JDIRkDpD/bH5fOWv7fQvW6NATbj
	TliWWW8lmVuUZX6TRDw7Lpn/By+pu8zlu0p4TyTxFVmHKvpfRi05osntveh6IbhK
	7EiGkKDeFvT98ErDyR+rjifSOXJ+Mi8pSlU6uB92roKfBBtQiK+5xyvZj9rD2nA9
	y9S309qsfM0pADGKh/h0SyHzNdJefUiL0lGjk55U/pxR4RPXyOTvHrBjIpp+VaNq
	RSigUQXclEmcwheRFONkjW3//6ZIjBT2qrEeDGqIiDcAc56+TVjzieel+5XlpUVo
	w3vQgeI/lLfQk4H5ufDCMhptwZTsJJXvIg2urm+QP4MHGg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489b2a49xm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 04 Aug 2025 09:34:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e7ffcbce34so131675985a.1
        for <linux-firmware@kernel.org>; Mon, 04 Aug 2025 02:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754300042; x=1754904842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0EtB29QCrGU1mZ3zkMd2RvDgUQ/9lb/W4SaXQGmHBU=;
        b=qEXEJtl0NIVNfJ6tlaGWcOEbhgEFfz6+MaVJVO3TJawRXE9s1KrETnPZvWpqb46JX5
         kNzvUr7rzLSPMTHPlgTQuAq/4Jx9d5nxuo2qBqa5bXT3G6WZcB8JtvgCbpAqii2P/260
         jLzWKPJF6GmjD0bKosw5h0ljv8KiFbpvRrlVzyfVBy4nPjsnbdfXRSLqef8COHWSOvxm
         CyF4rFDSRc8QdSubDls09Jb/QAymu1Ss0Vo6NyPNWMAM0MpMRhgCTgr5Nm/NC2UGv/yB
         M45bCPiKHCq9VssW4xsIGjQCLY0JhlIAzypHmWdIpwOvepHQCq/+f7Pz5aruRV+7EwD1
         B1pw==
X-Gm-Message-State: AOJu0YxHBM3XSUdbVAtNkpw8sM2Mw2ln3q6E2xj70qdZV4BIINo3h+qR
	EALQhDAknvWGqsEjWkw9GSBfjz9BMeSgxCk1wkTTzfTQTuR+PaqRLGFb9zBzwIsUMO5G3cyc/zX
	9QQD52ynL45mEcAZIz4DIEkzTbICyiqRUkGDQ8EYlLsWj/XSKjZPy/0mFTODhK5k=
X-Gm-Gg: ASbGncv4co0O/eiF/4y78y9JUG9N9a677Y1doa1uhGIoANDFQzZeZ4T6qyzhkaei11p
	dyWzCuQBKWmxkMwYcWikvebGMoOixTm8efqG+/Wy8+OEoTMnGa/tig48f7nOy/L6VsLs+YQnuhj
	0YpA+Hgyctp/208bRUG415qoDnTlpGBQ4GP0rwbk5WkOVRVjfJXQf1RFwflwh+6btcMA+6CO3he
	rJJt0yakZtLGVZrHjgGIFPjeIAmxZ2CbU3dy8IduN/M/LWjcImwHkeGOXYjv/DsxWErHosIcV0c
	8AX4rSLekBCYVP6tOglgJcmIYG5UUT/NQLfr4NURzhidl6O5Ok11PyU+YU9rW01RuLU6dX3p2KT
	4anw1OSUkC/w4AOSvhK4AQo3owa9xwARmwQqidum75TToa6KbeGv0
X-Received: by 2002:a05:620a:c52:b0:7e6:8819:cbd with SMTP id af79cd13be357-7e69637b74cmr1135409485a.45.1754300042019;
        Mon, 04 Aug 2025 02:34:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSl8knROspz5DklHr4WOpIZVG2tQUqU/D6THj8b3ob3nWEaTKQTUAqhvxSoph9AWdsTPirbg==
X-Received: by 2002:a05:620a:c52:b0:7e6:8819:cbd with SMTP id af79cd13be357-7e69637b74cmr1135406385a.45.1754300041440;
        Mon, 04 Aug 2025 02:34:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8899ebe9sm1624891e87.48.2025.08.04.02.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 02:34:00 -0700 (PDT)
Date: Mon, 4 Aug 2025 12:33:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <vkasinat@qti.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        "ekansh.gupta@oss.qualcomm.com" <ekansh.gupta@oss.qualcomm.com>
Subject: Re: qcom: Update DSP firmware for qcm6490 platform
Message-ID: <nxdmnhiysanfrebfwpbbvs3i64zcxvv27taqfflrmp6lyan3xz@fxpghuglviap>
References: <IA0PR02MB9917670B5507A3ABE0A216FEEF23A@IA0PR02MB9917.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA0PR02MB9917670B5507A3ABE0A216FEEF23A@IA0PR02MB9917.namprd02.prod.outlook.com>
X-Authority-Analysis: v=2.4 cv=OKwn3TaB c=1 sm=1 tr=0 ts=68907e8a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=74J_fYKs0qJiu8j2Rn0A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: wP-KgSJ6ZVHoAvrCBLYbM4kSLc8yydqT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA1MSBTYWx0ZWRfXw/dI66V2ujDB
 PuXSEmerOpMjTMmEYxrEO24Z+MU5+0mZkfLEXXKAlvKjcjz2tVENvBWbloyPXL9i7ahOA3OmYZ1
 x8j2G6zWd1fW8aD0+tvs2oqYYocMBZ1lY39i5z1Ud5k+byzAtonlEXlqmlqk+f8/Da40qypdVn4
 px0Mo0v8rxHwd/Fcla+2ULZNkSv/D1L39AIOAu4Q5LiWHQRIEFpuVnn7kQruQjiA/5/prQEjd2X
 wsw4yFZCL/waKIY8zF+WmX+p2IMvQajLRCSlM7vSh+CVn5ScGpMKlMcscx7isUNAQSbvHO8E/+R
 feqNMRlRZJumNbngh6DNeMIfxNXdHmkaWR8YfXcilLVNH2YufO9zoPkOaeNgJHj8XfGCnYnKLoq
 /24a1+5nyu87THRSkgZnZvfGa+7QCtM2zyPbWXEODFvJdX7rNm35oW4jWVSXZEkIadipDCRo
X-Proofpoint-GUID: wP-KgSJ6ZVHoAvrCBLYbM4kSLc8yydqT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=918 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040051

On Mon, Aug 04, 2025 at 09:08:26AM +0000, Venkata Kota wrote:
> The following changes since commit 910c190740916a9969ad5105137fb88ae4ce34c8:
> 
>   Merge branch 'intel/dmc/xe3lpd/2.29' into 'main' (2025-07-30 00:18:22 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git dsp-fw-qcm6490
> 
> for you to fetch changes up to 5d8fc0d700640138f1890e675c0ba3e80f8b6f9d:
> 
>   qcom: Update DSP firmware for qcm6490 platform (2025-08-04 14:33:36 +0530)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


Nit: there is no cdsp0 on QCS6490.

> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: Update DSP firmware for qcm6490 platform
> 
>  WHENCE                |   4 ++--
>  qcom/qcm6490/adsp.mbn | Bin 12079548 -> 12693084 bytes
>  qcom/qcm6490/cdsp.mbn | Bin 3637248 -> 3637248 bytes
>  3 files changed, 2 insertions(+), 2 deletions(-)

-- 
With best wishes
Dmitry
