Return-Path: <SRS0=DzPH=4M=oss.qualcomm.com=dikshita.agarwal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266F3CAC5B0
	for <linux-firmware@archiver.kernel.org>; Fri,  3 Oct 2025 15:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11463C4CEFB; Fri,  3 Oct 2025 15:45:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B1FD9C4CEF7
	for <linux-firmware@kernel.org>; Fri,  3 Oct 2025 15:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B1FD9C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593BoEpu019972
	for <linux-firmware@kernel.org>; Fri, 3 Oct 2025 15:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R/2TNVHSHIHTBiGIFL0cd/
	XQyk31J4R/YzW2WjXYsL4=; b=FzOuiDz3MK9uMlOdhtGIT6BW7UQHilmlQi99tS
	iz40yCFHGVY2nHeWc0SvCS84tpcF3K63DZtIG/YYVfH3k0GB//L4otV6cBYlpdik
	haThto48GgKvja3wF9V/GXz9391x3pt6hj1C1sRcj5WVfzNgkQyOHJcErY1JybPY
	sEWueCL+QBb2a/BpLt91be10SjHNQ0euyIIQeDPbbhaPhT9rRkxyLCGmTXNBjZ+G
	mjBBgb5JaYrAEltE2uXZzls0+///q+ZwCa96P82HHQdr507UrOf+UnbxLv5T6Hra
	vNk6g8NIZpM9uSLddym3X+01TDbwZhjnBhTfUjpfeALCLyLA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49gyu1fj5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 03 Oct 2025 15:45:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b55118e2d01so1705750a12.1
        for <linux-firmware@kernel.org>; Fri, 03 Oct 2025 08:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759506320; x=1760111120;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R/2TNVHSHIHTBiGIFL0cd/XQyk31J4R/YzW2WjXYsL4=;
        b=E3E3wurEcFLs3pK+W2LoNwqNCGyUjDC1hXe4PhQLTJGlKSYqsI4bhBMcjlswtdv4N3
         IejKIE21yp8VaXzr05Bx6wXsPfbEjOrcQQSxsoQK+Od3Zbkl6zIov2xod9qBbcTwYH9t
         WTp2kCDRkhsa3wgEOCGe1ug7hIN9FMzSpu+iNM3QMfyOnWuf1FsAhlwEFuHR/dk/hohR
         u8Kof6e5Z3FlO9XGh1KGTE1iPua/UqnsjR+XgJs2a7QgNwU/W+uFLB3rr8oGlCyQai4j
         EhRPk93rqJkKExmUna1yCAzvZWd2rMeyGJIfzOnIJxZg0/fwD4xMlcIZHT8vaO4pFO5Z
         d9tQ==
X-Gm-Message-State: AOJu0YwGJZlkyziW1m7n+Jijm3TqkYgza8QhRL+lmqeLbseC8F4YRq1h
	9+vuTvIKP5NEAyZEaHpMyxM7LDY8JUJUVt0wTfcQEyeDP5EHprUY2Ybpwtpbn3cswik3OkTvP28
	VNYd6BzF20EZdN71E7c8yuQydeZZbcLSaCNVY3p78TYG1pWPB035qAfNElRIiFw23WL1NWK8=
X-Gm-Gg: ASbGncu96+kZpp5hbEQr0Yg3786Vc879MlUJfuO7076Yz0kESU2gYCqyDGDpDBPe0L2
	9VSMSzPGfV+C/XqNJSYbYF0mBInjc458e1hhc3MPSL6RpTS283P20HTdM9cAn+fjSGNZTbgn5LG
	AsdR4UaRlbKXFWVNSvJLyXwb3Qinldle80+8EdH+Wit9zbaBBkiiHuHLVuo6NbKOF7wEw2iHF4J
	BBwXcO+87Klwnz9SpxHI9AC420bzRAk9/tp/YY8FiPtAXG+cElCvpr7Ur0SO+7MkRRIBwQynd07
	oI7XYTTfwLLSx6qNb+ijYejgz63BszDyqvjPXzLpCzZBOd9rYIVmKSZZMOT1dPpnY9keK8LcD5l
	az1k=
X-Received: by 2002:a05:6a20:42a3:b0:32a:7759:663a with SMTP id adf61e73a8af0-32b6212a30dmr4578992637.59.1759506319930;
        Fri, 03 Oct 2025 08:45:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfg+Dj4nE/eYRjhnnp7Et9zUcOnEngRzbz+m8lwBrnA5Ljggrb73S6pvlbHdP12uSDMFD1XQ==
X-Received: by 2002:a05:6a20:42a3:b0:32a:7759:663a with SMTP id adf61e73a8af0-32b6212a30dmr4578966637.59.1759506319510;
        Fri, 03 Oct 2025 08:45:19 -0700 (PDT)
Received: from [10.0.0.86] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099ad926fsm4957797a12.5.2025.10.03.08.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 08:45:19 -0700 (PDT)
Message-ID: <765d16fe-7ae1-1af4-6349-f69bc748e720@oss.qualcomm.com>
Date: Fri, 3 Oct 2025 21:15:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: remove link for Kaanapali video firmware
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RfGdyltv c=1 sm=1 tr=0 ts=68dfef91 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=qC_FGOx9AAAA:8 a=d6JWdf4Yo7Osh3SS3XUA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=fsdK_YakeE02zTmptMdW:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: Oo0yZ9fy7qKAsQPhqKmunuE9OOv_3MjO
X-Proofpoint-GUID: Oo0yZ9fy7qKAsQPhqKmunuE9OOv_3MjO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAxMDA1OCBTYWx0ZWRfX5JWju9gDTAb1
 aOx7PLw/kgzbsiVTlW5QFeK+LpAL+cgngGf9jb3Qatu5e7htkG5KBNLsRtUvlUktljMOTNNZbgg
 gvqHlIatIiKmO+jr3vDJ0mK5OauSS4YyJw0a/aU6O+VYar27E/WXcAz9lL890xmhLTZCF7/IozW
 YgXf9CnRWh9R/+hfmo2nyPGPrREGPfD05hRdkTZYRyvwpUZVE3Rx3bc06K7mlIC1uThaFJL9T+T
 eI9EyQHwtkxcl7RfgAhFRfccclrjX2N6LWIh9DRJkfV3QbQQZDbm2J2FKm7Q9lpp+e40LksNHpJ
 1n6WpNH0OJc3+fHZCPoyv5DcLoXJL/Sz34UfYYFnxCOmUHeKcFfrkQbinlSjCat9sbGYY420cPt
 lobxPIlV//ZgwpfrG+FeSS853R8XlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510010058

Hi,

The following changes since commit c12b12c3bf89f0d9d038d4274c6b36b362af03ef:

  Merge branch 'amd-staging' into 'main' (2025-10-01 22:13:43 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
video-fw-kaanapali-update

for you to fetch changes up to 6680b8f606d96773fcf966dd5bcc6a467c94bb05:

  WHENCE: remove link for Kaanapali video firmware (2025-10-03 21:12:33 +0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
      WHENCE: remove link for Kaanapali video firmware

 WHENCE | 1 -
 1 file changed, 1 deletion(-)


Thanks,
Dikshita
