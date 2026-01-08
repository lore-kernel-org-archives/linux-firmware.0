Return-Path: <SRS0=UU7q=7N=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80439D185F0
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Jan 2026 12:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 694C3C16AAE; Thu,  8 Jan 2026 12:48:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 908DDC116C6
	for <linux-firmware@kernel.org>; Thu,  8 Jan 2026 12:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 908DDC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6088OsBp2239380
	for <linux-firmware@kernel.org>; Thu, 8 Jan 2026 12:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OZ1weFRrmmmfsLiGeu5L+atBRKKrTXLL4dve90MnH5k=; b=UW4U7Zl2FCpMs8gh
	9KacMyIEmTkZhUpUg7m1beyH06DEhJcbxZB3BqTTA8UmZlKnbT0jFIbyLSuKAAwX
	XZX2yF4B6LvqrZG+rhh0JfboSd2/EcO8fqp6Cv8LttDylqawv3YYpSHKYwlOCOZi
	Ga/NTKiaCoW29NJAbGTZ9Ls5JKwZcBVyWVk4WpVCUbQcy6A4c+MYt5gZauPITj2U
	VSpg87fXJGkImMT9ZpbS/wmf0JAc/o3+D5MLr5Mhm0nBTVlltqdtSgZXRoPvIDZs
	CYviQgqcjdu+bKmvo/iiWDR+US1in800m34zK/6uvBXFo5piyLQSny6+el+EQ0YQ
	PVEU6w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhqwg4104-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 08 Jan 2026 12:48:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c1cffa1f2dso536050885a.1
        for <linux-firmware@kernel.org>; Thu, 08 Jan 2026 04:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767876532; x=1768481332; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OZ1weFRrmmmfsLiGeu5L+atBRKKrTXLL4dve90MnH5k=;
        b=LKYLJ1GdRVikV4QTcEEJmUF5SUlAfijuR1V198XWHH/c+5YzdTKutPKg7emtW0byZW
         yq4Eq8Z6RSZ3Ya9wr9f+8jSqJ81pzZJNrF2nogOXGS44RUKSg0TAWeUxOTYaWWLY1WO1
         oM919Jp4+HUIe9In5p/mXKUwfqgqxjgwj2z136PNUjX3RHVWaRuaQUX5wMc65wcOIMid
         lrp4ezp0/2zpNy81WACcf2PWEKgWl7Kq1mUTe8ALjcuF3iegDUkX4JpWhlfADjL67vD2
         Tp+Rj3hzw4NKFfK24ELjl508B51lqgs457sdgTUoFp/QdeIcuh/mNVhf4gKOqOqBLmYq
         R6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767876532; x=1768481332;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OZ1weFRrmmmfsLiGeu5L+atBRKKrTXLL4dve90MnH5k=;
        b=Li0kiuVJvFZq5wQaig8w0df8+FMPkiUUH+SpmMEGYHa1MH8xf7xI6T2LNHMhvydlUP
         +334aSjyULHFj/svFimqeGEey7siOjs2szkcdy2wx/aqaizkiroLciwqcDnRpMVXjmfc
         oDh7yqF0xAhbxZBbMa2dWrqA8udUGt4DgEdk/IXWFDCYHFvGftQR+H4jbNPHXJUokCOC
         vA/0/cMeu1X0W232bBjMsXvZlmc+DDgjoZHuICD0QkYPcwTKmnJYzlzfGSy5kKXH5Mbj
         My//GAGG0iDrSwKkz9D8uM3rvaAKAQCDRJkIe1ecFVbnwoqdpnkA/PLVRBeHc6QjPJL5
         vOag==
X-Gm-Message-State: AOJu0YxVsUIJ2spU9GMevSeRUCakUhVcPz7K53uDarrX78RHIUova/Hu
	sr+3Ur5VOc+B4Ij6ZZ4CwKO/+GU0olC6U7umn19Fj0kcK9zMl7GCn3EVsZvtg/pGmg4ld8T2bhk
	hxX/RbB34898RhRp2w4ZucbMFztYtuLXis9oEaBDE8Xi0uSdASKfKPNrolqdk9Xc=
X-Gm-Gg: AY/fxX7P5tUX3+FwFOwk+9D0IyTRgmX3V4GeP2BbunygBsEY7jEmOhJ9ppa/o5HVA+M
	5XkKna/dl3tlGqIOYQcGLS/5lJ1N8+wlawb9vljK699aIqZ8hXvT3aQR+F8HYqe0Lwtgr/cmVxM
	ePkl9oBr7eIjHux98F+Uovy52WU2TPVl5dgzJlXn/JbFcyDhnzELGXosxSN8AApvHo4HfA/gtxV
	W9yC1u0IeU/KwZV6IXv1HXQd0P9eW8EWYXJgAqybNGbnLkj0DnHIz5SLq6VbknY0z7w9/WX7Ac1
	LHDuJ7n+2+k6Mu0OtWbRISrMQwjCaX1QIGKYJkaCwPme5GeNMZVgo01lTsQ4qonPhPf01TVO5XN
	Awp6+W39O2V+cnYEIQDeSWib3GgN9o7Mja91nLYgtBiMwx5nTChQi/iuUwEH+Pkhh42EiCB5cuW
	DwTP5XAO5N00d54Y/atLoPu7s=
X-Received: by 2002:a05:620a:40d3:b0:8b2:f5b5:c9bf with SMTP id af79cd13be357-8c37f51e9aamr1316473585a.22.1767876531702;
        Thu, 08 Jan 2026 04:48:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHS2lU7v54sJVoloSwWtNdq7FnR8vTvTIdffKp5nB1KaoFPujh12C96VsPXeNEPhM1m1sJCng==
X-Received: by 2002:a05:620a:40d3:b0:8b2:f5b5:c9bf with SMTP id af79cd13be357-8c37f51e9aamr1316471185a.22.1767876531235;
        Thu, 08 Jan 2026 04:48:51 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6e821f52sm1342080e87.29.2026.01.08.04.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:48:50 -0800 (PST)
Date: Thu, 8 Jan 2026 14:48:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        "Mohammed Sameer Mulla (QUIC)" <quic_mohamull@quicinc.com>,
        "Harish Bandi (QUIC)" <quic_hbandi@quicinc.com>,
        quic_janathot@quicinc.com
Subject: Re: QCA: Add Bluetooth firmware for QCC2072 uart interface
Message-ID: <iep7i32ovru6j42fx5l54rmw3ihhoetd4isvwpkvvwlekujcx3@ytwjeawwqz6w>
References: <ade99252-a85c-4399-92f1-56156f509814@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ade99252-a85c-4399-92f1-56156f509814@oss.qualcomm.com>
X-Proofpoint-GUID: IkirYqvccH3zhQJhKgqNSyX4ZQuzwFFh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA5MCBTYWx0ZWRfXwLQQrhPweLdp
 Ll6aUlID3h26ReY0P61w1W1qA0AuBS5XMt/zt8FAh9mWMYQf5/5qjWPwxDqa2QywzAlqyXXBSy9
 cLox349UiF3V8kdLV3t6tAHANRSMyeDp6VrApTfaPURH3UY5MFWeCD87T6OYU+dHYl2KiCxsVFW
 6iYs+DJDHcA94Kgjh6HjmDnuBPeXlAfsKY++h8smBn8ueEmnsDQXrjZ6qilF6O2ejx4xXheiEcw
 Ug/am1H+fjwOYJwSNx+I48ybxU0YgSbgZJHvsMnzs/z0Zq4ZtKJKwT1T5O4BnjPpNUZ4rlTjv42
 PMTICodsz2BLUXyAJBNw+yOj3pbBuBuPgA5/NYtml/lI2bwK2VoAAnlZXIICu3bB9kiK73EudZo
 TTBYnDpA/ku/zP6iNdBY478pX8kYRBbm/Q+jxpwXn/CwFoH6BXTHxQhNJsc+HQgggQ2OEElaEfn
 mecOFwdzUYCEdt+QTIg==
X-Authority-Analysis: v=2.4 cv=Pa7yRyhd c=1 sm=1 tr=0 ts=695fa7b4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=C15eEx-zN6zWdQ1evr8A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: IkirYqvccH3zhQJhKgqNSyX4ZQuzwFFh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080090

On Thu, Jan 08, 2026 at 02:33:22PM +0530, Vivek Sahu wrote:
> Hi linux-firmware maintainers,
> 
> Here's a pull request for btqca bluetooth driver. Please let me know if you
> have any problems.
> 
> 
> The following changes since commit e272e0d1edce58496c3917f7422b9531daeb0535:
> 
>   Merge branch 'robot/pr-0-1767725013' into 'main' (2026-01-06 19:05:06
> +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/vivesahu-huboss/Cologne_FW_Upstream.git HEAD
> 
> for you to fetch changes up to 5fce4edd5a84b09c670918cfcaa0705eaf1c2b60:
> 
>   QCA: Add Bluetooth firmware for QCC2072 uart interface This commit will
> add required Bluetooth firmware files for QCC2072 uart interface.
> (2026-01-08 13:20:45 +0530)
> 
> ----------------------------------------------------------------
> Vivek Kumar Sahu (1):
>       QCA: Add Bluetooth firmware for QCC2072 uart interface This commit
> will add required Bluetooth firmware files for QCC2072 uart interface.

Oh. And your git setup is broken. How did you end up with the SoB not
matching the Author of the commit (yes, I really want to know, how).

-- 
With best wishes
Dmitry
