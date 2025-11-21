Return-Path: <SRS0=8/BF=55=oss.qualcomm.com=renjiang.han@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C25CFA748
	for <linux-firmware@archiver.kernel.org>; Fri, 21 Nov 2025 08:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2C998C4CEF1; Fri, 21 Nov 2025 08:08:03 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3E019C19421
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 08:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3E019C19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL54CRM2841481
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 08:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WEOHglvmqWCBH4rP+esNq39ppqePvCbxBIewABnXO3M=; b=G5Dy73OPH7n80Cjf
	O7mi8y+QBWpO3LClO06VbuxnG2wtPvRyqIOvVo1Uq5wCtN/b39vr+t1aLWHJhki5
	ROybYdAvKpFn5yKf76ZBP4lro8QqApy/HDjsYJg68D5AehKaXQcmuV+dfJBliUtP
	iqqBYEFijQt5oMzrtvZTuM3Gmh31ePd7tE2ozOp65bLso6UgsWf+rPR9E7adfbFI
	ekHGgI/g64NvRF/6PhoUxIIbaQ3mii36bTJ1JBymeDPHs6tOwLe8er984AI5OGdG
	prKnQhYKqL4o1pdTw/S5XJh1SdXEY/oTxLZhUV7NwAdgQ9qo32hyatRd9Tr5bIan
	uCXHxw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhkvgf8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 08:08:00 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a9fb6fcc78so1506500b3a.3
        for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 00:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763712480; x=1764317280; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WEOHglvmqWCBH4rP+esNq39ppqePvCbxBIewABnXO3M=;
        b=UJJVWv5GAPC2DaNW/rBrupCBQRlZIYH8dqmV312vA8gZZjdI0pSg+M8+wUI7ta8L8b
         1HYI/qzNsh5yfCqfZiUVd6yVj4bKnqA5ibX7zpJhAV/7sFK47rIVKzFUyU1MMZaySgaK
         miVsAaBGee+csMRNx9MgkLrsXwka+AWq80ubpM4thVjygJeuBS8qKWVNGNWV/WFvc+no
         LaasCC1y+0r8Pa50q4YdpMjTStY9f5U8zTQz2rb1lPfhpRtho9JlRGV7+dxaj8Os6zBQ
         BOznOKyB+mEgWTMz/qmYmZj9fF8+7u+xlESypOCuHNnUJKUlNNRdcDeet0BQbj/BTj0s
         vV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763712480; x=1764317280;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WEOHglvmqWCBH4rP+esNq39ppqePvCbxBIewABnXO3M=;
        b=gdjzv6Sh1MkldF7GvowlVs00C/aNjB450vCsGsSkwE1DXnXJ5RtgI6FAz9qp1rXlf4
         CTb8PXQ28aK+19ljOHrXhK0U8uNCl/EiO292xQwI4rAbBWb1UASWTf9HDXybk8txu3C6
         lobu+Bpaj/zdo/NodeDRiuQSCtTOUdB3W6Xs+CfqLoigxnxquq29n/A0SUQmuvpj6RsG
         yWh4sa7A0pZhurr69xeKYP9jaZIXODDaJH4GFcI3mBLGZ4hMSZOpVQy6UlZqar0xqfe2
         FlEsjLEFn2T+mvnXUJAZGUpFzrYfVEYDpH1rO3UKClCV3jCFs0KqbkypaAiY9EDBSfWD
         zYtw==
X-Gm-Message-State: AOJu0YxVEwaYLaY+87olHso7bvtccKPGc7UH7x5e+7pwuGd2vQ/5JJaR
	dAHc7gfel+EIMzasTLEG2HJ4tN9ExMF/vOUY1dURxlOsC8XUOJd9LI3GvD1x4rIPMF5z+FNxCZi
	7e8upvrZvhFh2gfwfxwWOeLnWIDCs0Yqiv/CyNCPmwNDywc5H6Nz+4OMtDLj3+AI=
X-Gm-Gg: ASbGncsVkNriHGH+3yquzS3Rff6YFGJeF5AfsOyhTUMrrWnPX8Ppbof1KRsMRjpGZ6+
	Gyn1uupaGUUD9F0zr6Fbkhc2Bsz0+zOy4zZyWR5oGx1Lti8pw38pSoIX+4pjIxDBCjWeeziEa55
	Ee4QRq4dAAT6Y3FNzLBZ/7aTtYgUBf1y+klEF8qx9loSXxMHyev83sxz3Epifey8ygiD4RoeIqQ
	aeO8Ivt6lOB+lGGNYT0E2zaQ4UTnFCfDgXZKO3t3eatUfra+bwwS3Z4aH7tM36rHs5q1S+FGBcc
	DpiWs4dHC0LRqX4BlyoPeMXpV1xNsLhOI3vYWR2Gw4Wagv5YZoqE28svlowsSz00GVf5NSvIXWT
	t9FR07CzXwmnqhHC4hEhIn6/pUzQsNNY0ggrc2jiMtocOrDLOYnzz4qA20/P+LfKkg0eTEX1O/B
	38ujkd+w==
X-Received: by 2002:a05:6a00:1ad2:b0:7ab:5d1b:2d12 with SMTP id d2e1a72fcca58-7c58c7a3afemr1665651b3a.8.1763712479654;
        Fri, 21 Nov 2025 00:07:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSTFj8zggahR7qBug9Uq4TWaGwzw5MQyC3fddZQh5C47NLTvcgPoH/13/v4gXoGI6MRISadw==
X-Received: by 2002:a05:6a00:1ad2:b0:7ab:5d1b:2d12 with SMTP id d2e1a72fcca58-7c58c7a3afemr1665622b3a.8.1763712479183;
        Fri, 21 Nov 2025 00:07:59 -0800 (PST)
Received: from [10.133.33.155] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f095ea28sm5143334b3a.47.2025.11.21.00.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 00:07:58 -0800 (PST)
Message-ID: <c075a26e-8544-4b8a-81c0-c2473dc36c98@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:07:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: update firmware binary for v5.4
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        dikshita.agarwal@oss.qualcomm.com
References: <d3442fba-a616-4260-a2c1-bf14d0d64250@oss.qualcomm.com>
 <jlnmauqconyiaujadjrffjeqbzkc6pa7vrcmnjyueuuamfguhg@ln43yypqrvoq>
 <7111892d-1351-4c94-82f0-8566c34f16c1@oss.qualcomm.com>
 <jodkivawdceoc7ebzm34w5ocipnv7zpjvasadyha6kdpayluja@255mxfp4eq5f>
 <1a8feea5-e797-4a19-a1d8-e4d5d5bca0c9@oss.qualcomm.com>
 <iznnjuldjlzscbasoxxwgemtd37pemtpo37dw2q7fj3pfct5y3@iepxxugydewz>
 <1db4c5a7-74f8-44e3-bb56-cf075e4391bc@oss.qualcomm.com>
 <lp6zqc63rznqakiyixdjnzwlaesvoelcmbgrxosq76ijufuj5f@gtwleb2fz6hh>
 <0befd966-1db0-4b47-a8fe-a40a400a7103@oss.qualcomm.com>
 <vh7nnjywovzr7oeaou3uphfhzc7sxry3n3vg3miuj7ydtelu5t@hvylaofyuhbc>
Content-Language: en-US
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
In-Reply-To: <vh7nnjywovzr7oeaou3uphfhzc7sxry3n3vg3miuj7ydtelu5t@hvylaofyuhbc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zxi33S8FN2459kABeNd6N1WYvED_esPF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA2MSBTYWx0ZWRfX1zg/jQ6kInuO
 3yoVSrmKXg9tDVWfiwrpr98NgWg2rshrrMY5gwj2W8AN2Al4LAyGlHjGrQ0Ao0Uj0V21Tsw6WDw
 n3TM9HcTX4xEz3SIrGSUHhPkbk5Za+/OiJ+jhJSqlOEV4C7a41Q0o08s2CbW/F1fiXIMnDVAI/V
 9L/3tHcFcQ4PfBwGOu05GKCZOGAbsdyu1pScF+JUo8T945HXsgb1AehXzC6ujd+ev3H+OgzhlmF
 JckY8u94H0cqwjtG02XQcQ7lvFvrUYVa8smiIMZYGAOx2I7ZSUA6/ZEk3s7FsaidoRKoClIfeRE
 0/yBYT+fbkndWu2ndoKncBW5TmKHB30PnwTY6HJ+bA9xjaWTpfw3/sqnqN61E8KPerOrkxgBSjU
 AdJgpr+z99ZecaxxRUyH0RIfjQJTig==
X-Authority-Analysis: v=2.4 cv=bpdBxUai c=1 sm=1 tr=0 ts=69201de0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=FrrMbr56v4IGu9LFB34A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: zxi33S8FN2459kABeNd6N1WYvED_esPF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_02,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210061


On 11/21/2025 6:24 AM, Dmitry Baryshkov wrote:
> Which ProgramHeader is it? I don't see any alignment issues with the
> 0059 firmware.
>
> $ strings /lib/firmware/qcom/venus-5.4/venus.mbn | grep QC_IMAGE_VERSION
> QC_IMAGE_VERSION_STRING=VIDEO.VE.5.4-00059-PROD-1
>
> $ readelf -l /lib/firmware/qcom/venus-5.4/venus.mbn
>
> Elf file type is EXEC (Executable file)
> Entry point 0xf500000
> There are 5 program headers, starting at offset 52
>
> Program Headers:
>    Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
>    NULL           0x000000 0x00000000 0x00000000 0x000d4 0x00000     0
>    NULL           0x001000 0x0fa00000 0x0fa00000 0x01a98 0x02000     0x1000
>    LOAD           0x003000 0x00000000 0x0f500000 0xd5de0 0xd5de0 R E 0x100000
>    LOAD           0x0d8de0 0x00100000 0x0f600000 0x08468 0x3f4000 RW  0x100000
>    LOAD           0x0e1248 0x004ff000 0x0f9ff000 0x00020 0x00020 RW  0x4
>
> -- With best wishes Dmitry
ELF spec: (Offset % Alignment) must equal (Virtual Address % Alignment).

0x3000 % 0x100000 != 0x00000000 % 0x10000
0x0d8de0 % 0x100000 != 0x00100000 % 0x100000
Therefore, the Program Header alignment in this file does not conform to
  the ELF specification.

-- 
Best regards,
Renjiang Han

